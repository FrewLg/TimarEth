<?php

namespace App\Controller\SERO;

use App\Entity\ActionAudit;
use App\Entity\ReviewRecommendation;
use App\Entity\SERO\Application;
use App\Entity\SERO\Amendment;
use App\Entity\SERO\ApplicationFeedback;
use App\Entity\SERO\Attachment;
use App\Entity\SERO\Continuation;
use App\Entity\SERO\DecisionType;
use App\Entity\SERO\Icf;
use App\Entity\SERO\IrbCertificate;
use App\Entity\SERO\Meeting;
use App\Entity\SERO\MeetingSchedule;
use App\Entity\SERO\ReviewChecklistGroup;
use App\Form\SERO\ReviewChecklistGroupType;
use App\Entity\SERO\ReviewAssignment;
use App\Entity\SERO\ReviewerResponse;
use App\Entity\SERO\ReviewChecklist;
use App\Entity\SERO\ReviewerRecommendation;
use App\Entity\SERO\Status;
use App\Entity\SERO\Version;
use App\Form\SERO\ApplicationFeedbackType;
use App\Form\SERO\ApplicationType;
use App\Form\SERO\AmendmentType;
use App\Form\SERO\ApplicationInitialType;
use App\Form\SERO\AprotocolAttachementsType;
use App\Form\SERO\ContinuationType;
use App\Form\SERO\IcfType;
use App\Form\SERO\VersionType;
use App\Repository\ApplicationRepository;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Address;
use App\Repository\SERO\ApplicationFeedbackRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Validator\Constraints\DateTime;
use App\Helper\SEROHelper;
use App\Repository\SERO\ReviewerRecommendationRepository;
use Doctrine\DBAL\Types\DecimalType;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\Entity;
use Dompdf\Dompdf;
use Dompdf\Options;
use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\Writer\PngWriter;
use Symfony\Component\Mailer\Exception\TransportException;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mime\Email;

#[Route('{_locale<%app.supported_locales%>}/protocol')]

class ApplicationController extends AbstractController
{
    #[Route('/', name: 'application_index', methods: ['GET', 'POST'])]
    public function index(Request $request, EntityManagerInterface $em,   PaginatorInterface $paginatorInterface): Response
    {
        $this->denyAccessUnlessGranted('ROLE_USER');

        $allApps =  array_reverse($em->getRepository(Application::class)->findAll());
        $app = new Application();
        $form = $this->createForm(ApplicationType::class, $app);
        $form->handleRequest($request);
        if ($request->isXmlHttpRequest()) {
            $result = $em->getRepository(Application::class)
                ->findBy(
                    $request->get('live_search')
                );
            return new JsonResponse($result);
        }

        // $allappsbyme =  array_reverse($em->getRepository(Application::class)->findBy(array('submittedBy' => $me)));
        $result = $paginatorInterface->paginate(
            $allApps,
            $request->query->getInt('page', 1),
            10
        );

        return $this->render('sero/application/index.html.twig', [
            'applications' => $result,
            'form' => $form,
        ]);
    }

    #[Route('/my-applications', name: 'myapplication', methods: ['GET', 'POST'])]
    public function myapplications(
        Request $request,
        EntityManagerInterface $em,
        SEROHelper $seroHelper,
        PaginatorInterface $paginatorInterface
    ): Response {
        $this->denyAccessUnlessGranted('ROLE_USER');
        $me = $this->getUser();
        $allappsbyme =  array_reverse($em->getRepository(Application::class)->findBy(array('submittedBy' => $me)));
        $data = $paginatorInterface->paginate(
            $allappsbyme,
            $request->query->getInt('page', 1),
            10
        );

        ///Form

        $application =   new Application();

        $form = $this->createForm(ApplicationInitialType::class, $application);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $protocolversion = $em->getRepository(Version::class)->findBy(['application' => $application]);
            $draftStatus = $em->getRepository(Status::class)->findOneBy(['code' => 'DRAFT']);

            $protocolversions = count($protocolversion) + 1;
            $version = new Version();
            $version->setDate(new \DateTime());
            $version->setCreatedAt(new \DateTime());
            $application->setCreatedAt(new \DateTime());
            $version->setVersionNumber($protocolversions);
            $version->setApplication($application);
            // end add version
            $application->setSubmittedBy($this->getUser());
            // Assign when areceived  $application->setIbcode($seroHelper->versionate($application));
            $application->setUid(md5(uniqid()));
            $application->setStatus($draftStatus);
            $em->persist($application);

            $em->persist($version);
            $em->flush();
            return $this->redirectToRoute('protocol_application_update', ['uid' => $application->getUid()], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/application/my_application.html.twig', [
            'initialForm' => $form,
            'applications' => $data,
        ]);
    }


    #[Route('/{uid}', name: 'protocol_application_update', methods: ['GET', 'POST'])]
    public function new(
        Request $request,
        EntityManagerInterface $entityManager,
        MailerInterface $mailer,
        Application $application,
        SEROHelper $seroHelper
    ): Response {
        $this->denyAccessUnlessGranted('ROLE_USER');


        $attachment = new Attachment();
        $attachmentsForm = $this->createForm(AprotocolAttachementsType::class, $attachment);
        $attachmentsForm->handleRequest($request);

        if ($attachmentsForm->isSubmitted() && $attachmentsForm->isValid()) {

            // $attVersion = $attachmentsForm->get('type')->getData();
            // $attVersionInfo = $entityManager->getRepository(Attachment::class)->findBy(['protocol' => $application, 'type' => $attachmentsForm->get('type')->getData()]);
            //If the attachment with this type is attached, then add +1 a version number  with warning. Else make all version one
            // if (condition) {
            //     # code... 
            // }

            // dd($attachmentsForm->get('type')->getData());

            if ($attachmentsForm->get('name')->getData()) {
                $uid = md5(uniqid());
                $versionAttachement = $attachmentsForm->get('name')->getData();
                $versionFileName =   $attachmentsForm->get('type')->getData() . "-" . $uid . "." . $versionAttachement->guessExtension();
                $versionAttachement->move($this->getParameter('uploads_folder'), $versionFileName);
                $attachment->setName($versionFileName);
                $attachment->setUid($uid);
                $attachment->setUploadedAt(new \DateTime());
            }
            $attachment->setProtocol($application);
            $entityManager->persist($attachment);
            $entityManager->flush();
            return new JsonResponse(['message' => 'File uploaded successfully']);

            return $this->redirectToRoute('protocol_application_update', ['uid' => $application->getUid()], Response::HTTP_SEE_OTHER);
        }

        $form = $this->createForm(ApplicationType::class, $application);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            ///
            //Add version//
            // dd($application);
            $protocolversion = $entityManager->getRepository(Version::class)->findBy(['application' => $application]);
            $protocolversions = count($protocolversion) + 1;
            $version = new Version();
            $version->setDate(new \DateTime());
            $version->setCreatedAt(new \DateTime());
            $application->setCreatedAt(new \DateTime());
            $version->setVersionNumber($protocolversions);
            $version->setApplication($application);
            // end add version
            $application->setSubmittedBy($this->getUser());
            $application->setIbcode($seroHelper->versionate($application));
            // $application->setStatus(1);
            // $application->setUid(md5(uniqid()));
            $entityManager->persist($application);

            $entityManager->persist($version);
            $entityManager->flush();


            return $this->redirectToRoute('application_show', ['uid' => $application->getUid()], Response::HTTP_SEE_OTHER);
        }


        return $this->render('sero/application/nativeWizard.html.twig', [
            // return $this->render('sero/application/new.html.twig', [
            'application' => $application,
            'protocolForm' => $form,
            'attachmentsForm' => $attachmentsForm
        ]);
    }

    // #[Route('/{uid}', name: 'protocol_application_edit', methods: ['GET', 'POST'])]
    // public function protocoledit(
    //     Request $request,
    //     EntityManagerInterface $entityManager,
    //     MailerInterface $mailer,
    //     SEROHelper $seroHelper
    // ): Response {
    //     $this->denyAccessUnlessGranted('ROLE_USER');
    //     $application = new Application();
    //     $form = $this->createForm(ApplicationType::class, $application);
    //     $form->handleRequest($request);

    //     if ($form->isSubmitted() && $form->isValid()) {
    //         $entityManager->persist($application);
    //         // $reviewfile = $request->get('attachment');
    //         // dd($form->get('attachment'));
    //         if ($form->get('attachment')->getData()) {
    //             $versionAttachement = $form->get('attachment')->getData();
    //             $versionFileName = $seroHelper->fileNamer($application) . $versionAttachement->guessExtension();
    //             $versionAttachement->move($this->getParameter('uploads_folder'), $versionFileName);
    //             // $version->setAttachment($versionFileName);
    //             // // dd($form->get('attachmentType')->getData());
    //             // $version->setAttachmentType($form->get('attachmentType')->getData());
    //         }
    //         //
    //         $user = $this->getUser();

    //         $subject = "A new protocol has been submitted";
    //         $pi_name = $user->getProfile();
    //         $invitation_url = 'en/protocol/' . $application->getUid();

    //         $email = (new TemplatedEmail())
    //             ->from(new Address($this->getParameter('app_email'), $this->getParameter('app_name')))
    //             ->to($application->getSubmittedBy()->getEmail())
    //             ->bcc('frew.legese@gmail.com')
    //             ->replyTo('frew.legese@gmail.com')
    //             ->subject('Your application has been received!')
    //             ->htmlTemplate('emails/co-authorship-alert.html.twig')
    //             ->context([
    //                 'subject' => "Your application has been received",
    //                 "body" => "We have received your protocol application successfully. You have obtained a protol number:" . $application->getIbcode() .
    //                     ". Hence you can track your application status using a <a href='http://127.0.0.1:8008/en/protocol/" . $application->getUid() . "/details'>link</a>",
    //                 'title' => $subject . " with this link " . $application->getUid(),
    //                 'pi' => $pi_name,
    //                 'submission_url' => $invitation_url,
    //                 'name' => $application->getSubmittedBy(),
    //                 'Authoremail' => $application->getSubmittedBy()->getEmail(),
    //             ]);
    //         try {
    //             $mailer->send($email);
    //             $this->addFlash("success", "Application has been submitted successfully!.");
    //         } catch (TransportExceptionInterface $e) {
    //             $this->addFlash("danger", "Error while sending email!");
    //         }

    //         // endsend email
    //         // $seroHelper->appHistory($), "Review response has been sent ", 'primary', 'layers');

    //         $entityManager->persist($version);
    //         $entityManager->flush();
    //         return $this->redirectToRoute('application_index', [], Response::HTTP_SEE_OTHER);
    //     }

    //     // attachments form
    //     $attachmentsForm = $this->createForm(ApplicationType::class, $application);
    //     $attachmentsForm->handleRequest($request);

    //     if ($attachmentsForm->isSubmitted() && $attachmentsForm->isValid()) {
    //         $entityManager->persist($application);

    //         if ($attachmentsForm->get('attachment')->getData()) {
    //             $versionAttachement = $attachmentsForm->get('attachment')->getData();
    //             $versionFileName = $seroHelper->fileNamer($version) . $versionAttachement->guessExtension();
    //             $versionAttachement->move($this->getParameter('uploads_folder'), $versionFileName);
    //         }

    //         $entityManager->persist($version);
    //         $entityManager->flush();
    //         return $this->redirectToRoute('application_index', [], Response::HTTP_SEE_OTHER);
    //     }

    //     // endattachment form

    //     return $this->render('sero/application/nativeWizard.html.twig', [
    //         // return $this->render('sero/application/new.html.twig', [
    //         'application' => $application,
    //         'protocolForm' => $form,
    //         'attachmentsForm' => $attachmentsForm,
    //     ]);
    // }

    #[Route('/{id}/history', name: 'app_history', methods: ['GET'])]
    public function history(Application $application, Request $request, EntityManagerInterface $entityManager, ApplicationFeedbackRepository $appferepo, MailerInterface $mailer): Response
    {
        return $this->render('sero/application/application-history.html.twig', [
            'application' => $application,

        ]);
    }



    #[Route('/{id}/approve', name: 'app_approve', methods: ['GET', 'POST'])]
    public function approve(
        Version $version,
        SEROHelper $seroHelper,
        Request $request,
        EntityManagerInterface $entityManager,
        MailerInterface $mailer
    ): Response {

        $this->denyAccessUnlessGranted('ROLE_USER');

        $cert = new IrbCertificate();
        $cert->setIrbApplication($version->getApplication());
        $cert->setVersion($version);
        $cert->setValidUntil(new \DateTime('+6 months'));
        $certCode = $seroHelper->certIdGenerator($version->getApplication());
        $cert->setCertificateCode($certCode);
        $cert->setApprovedAt(new \DateTime());
        $cert->setValidFrom(new \DateTime());
        $cert->setApprovedBy($this->getUser());
        $version->setReportExpectationPeriod(6);
        $entityManager->persist($version);
        $entityManager->persist($cert);
        $entityManager->flush();
        $user = $version->getApplication()->getSubmittedBy();

        $subject =  $certCode . " ";
        $pi_name = $user->getProfile();
        $invitation_url = "verify-here/" . $certCode;

        $email = (new TemplatedEmail())
            ->from(new Address($this->getParameter('app_email'), $this->getParameter('app_name')))
            ->to($version->getApplication()->getSubmittedBy()->getEmail())
            ->bcc('frew.legese@gmail.com')
            ->replyTo('frew.legese@gmail.com')
            ->subject('Your protocol application status')
            ->htmlTemplate('emails/co-authorship-alert.html.twig')
            ->context([
                'subject' => "Your application has been approved",
                "body" => "We have carefully reviewed your protocol application and delighted to inform you that we have approved your ethical clearance. You have obtained a IRB ethical clearance certificate code: " . $certCode .
                    ". Hence you can view your protocol application status using a <a href='https://irb.ephi.gov.et/en/protocol/" .  $version->getApplication()->getUid() . "/details'> Protocol application link </a>
                   <br>
                   <br>
                   <a   href='https://irb.ephi.gov.et/en/verify-here/" .  $certCode . "'>Verify your clearance certificate here </a>
                    
                    ",
                'title' =>    "Verify",
                'pi' => $pi_name,
                'submission_url' => $invitation_url,
                'name' => $version->getApplication()->getSubmittedBy(),
                'Authoremail' => $version->getApplication()->getSubmittedBy()->getEmail(),
            ]);
        try {
            // $mailer->send($email);
            $this->addFlash("success", "Application has been approved and mailed to the applicant successfully!.");
        } catch (TransportExceptionInterface $e) {
            $this->addFlash("danger", "Error while sending email!");
        }

        $srringToGenerate = "Researcher:";

        $qrCode = Builder::create()
            ->writer(new PngWriter())
            ->writerOptions([])
            ->data($certCode)
            ->encoding(new Encoding('UTF-8'))
            ->size(300)
            ->margin(10)
            ->build();

        return $this->render('sero/application/application-history.html.twig', [
            'application' => $version->getApplication(),
            'version' => $version,
            'cert' => $cert,
            'qr_code' => $qrCode->getDataUri(),

        ]);
    }

    // #[Route('/email', name: 'email_send', methods: ['GET', 'POST'])]
    // public function sendEmail(MailerInterface $mailer): Response
    // {
    //     $email = (new Email())
    //         ->from("SERO -EPHI <irb@ephi.gov.et>")
    //         ->to('frew.legese@gmail.com')
    //         ->bcc('firewlegese74@gmail.com')
    //         ->replyTo('frew.legese@gmail.com')
    //         ->priority(Email::PRIORITY_HIGH)
    //         ->subject('irb@ephi.gov.et  Time for Test Symfony Mailer!')
    //         ->text('Sending a ser0@ephi.gov.etss Test emails 465 here again!')
    //         ->html('<br> It worked under the following Conf. Thanks! <br>
    //         <p>  Configuration line is here: MAILER_URL=smtp://ntcms@ephi.gov.et:n7cf455p4ssw0r6@mail.ephi.gov.et:587?encryption=tls&auth_mode=oauth !</p>');
    //     try {
    //         $mailer->send($email);
    //         // dd();TransportExceptionInterface
    //         $this->addFlash("success", "Email sent successfully!");
    //     } catch (TransportExceptionInterface $e) {

    //         $this->addFlash("danger", $e); //."Unable to send email!");
    //     }
    //     return $this->redirectToRoute('application_index', [], Response::HTTP_SEE_OTHER);
    // }


    #[Route('/{id}/revise', name: 'make_a_review', methods: ['GET', 'POST'])]
    public function makerevise(
        Request $request,
        SEROHelper  $seroHelper,
        ReviewAssignment $reviewAssignment,
        ReviewerRecommendationRepository $reviewerRecommendationRepository,
        EntityManagerInterface $entityManager
    ): Response {

        $this->denyAccessUnlessGranted('ROLE_USER');
        $recommendation = $entityManager->getRepository(ReviewerRecommendation::class)->findAll();

        if ($reviewAssignment->getIrbreviewer()->getId() == $this->getUser()->getId() && $reviewAssignment->getReviewedAt() !== NULL) {
            $this->addFlash("warning", "Review response hase been already sent!.");

            return $this->redirectToRoute('review_result', ['id' => $reviewAssignment->getId()], Response::HTTP_SEE_OTHER);
        }
        if ($request->request->get('review-checklist') && $request->request->get('review-comments')) {
            $commentArray = $request->get('comment');
            // dd($request->request->get('decision'));
            $checks = $request->get('checklist');
            foreach ($checks as $key => $value) {
                $theChecklists[] =   $value;
                $theKeys[] =   $key;
                if ($value == null) {
                    continue;
                }
            }
            foreach ($commentArray as $key2 => $value2) {
                $comments[] =   $value2;
            }
            $length = count($checks);


            for ($i = 0; $i < $length; $i++) {

                $theComment = $comments[$i];

                $theEmail = $theChecklists[$i];
                $theKey = $theKeys[$i];
                $reviewerResponse = new ReviewerResponse();

                $reviewerResponse->setReviewAssignment($reviewAssignment);
                $reviewerResponse->setReviewedBy($this->getUser());
                $reviewerResponse->setAnswer($theEmail);
                $reviewerResponse->setChecklist($entityManager->getRepository(ReviewChecklist::class)->find($theKey));
                $reviewerResponse->setComment($theComment);
                $entityManager->persist($reviewerResponse);
            }

            $reviewAssignment->setReviewedAt(new \DateTime());
            $reviewAssignment->setClosed(1);
            $selectedRec = $entityManager->getRepository(ReviewerRecommendation::class)->findOneBy(['id' => $request->request->get('decision')]);
            // dd($selectedRec);
            $reviewAssignment->setRecommendation($selectedRec);
            // $reviewAssignment->setStatus(1);

            $entityManager->persist($reviewAssignment);
            $seroHelper->appHistory($reviewAssignment->getApplication(), "Review response has been sent ", 'primary', 'layers');

            $entityManager->flush();

            $this->addFlash("success", "Review results saved successfully!.");
            return $this->redirectToRoute('review_result', ['id' => $reviewAssignment->getId()]);
        }

        $irb_review_checklist_group = $entityManager->getRepository(ReviewChecklistGroup::class)->findAll();

        return $this->render('sero/review_checklist/chcklists.html.twig', [
            'revs' => $reviewerRecommendationRepository->findAll(),
            'review_assignment' => $reviewAssignment,
            'irb_review_checklist_group' => $irb_review_checklist_group,
        ]);
    }

    #[Route('/{uid}/details', name: 'application_show', methods: ['GET', 'POST'])]
    public function show(Application $application, $uid, Request $request, EntityManagerInterface $entityManager, SEROHelper $seroHelper): Response
    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        if ($request->request->get('renewal')) {
            if (true) {
                $renewal = new Continuation();
                $renewal->setApplication($uid);
                $renewal->setRequestedAt(new \DateTime());
                $entityManager->persist($renewal);
                $entityManager->flush();
                $this->addFlash("success", "Revision sent successfully");
            } else {
                $this->addFlash("danger", "You can't renew IRB clearance for this application");
            }
            return $this->redirectToRoute(
                'application_show',
                ["uid" => $application->getUid()],
                Response::HTTP_SEE_OTHER
            );
        }
        $version = new Version();
        $versionForm = $this->createForm(VersionType::class, $version);
        $versionForm->handleRequest($request);
        $existingVersion = $entityManager->getRepository(Version::class)->findBy(['application' => $application]);
        if ($versionForm->isSubmitted() && $versionForm->isValid()) {
            $newVersion = count($existingVersion) + 1;
            $version->setDate(new \DateTime());
            $version->setCreatedAt(new \DateTime());
            $version->setVersionNumber($newVersion);
            $version->setApplication($application);
            if ($versionForm->get('attachment')->getData()) {
                $ver = $versionForm->getData();
                $versionAttachement = $versionForm->get('attachment')->getData();
                $versionFileName = $seroHelper->fileNamer($ver) . $versionAttachement->guessExtension();
                $versionAttachement->move($this->getParameter('uploads_folder'), $versionFileName);
                $version->setAttachment($versionFileName);
            }
            $entityManager->persist($version);
            $entityManager->flush();
            $seroHelper->appHistory($application, "A New Version Added with '" . $version->getAttachmentType()->getName() . "' attachment type", 'primary', 'pin');

            return $this->redirectToRoute(
                'application_show',
                ["uid" => $application->getUid()],
                Response::HTTP_SEE_OTHER
            );
        }
        //disscusion
        $applicationFeedback = new ApplicationFeedback();
        $feedbackForm = $this->createForm(ApplicationFeedbackType::class, $applicationFeedback);
        $feedbackForm->handleRequest($request);

        if ($feedbackForm->isSubmitted() && $feedbackForm->isValid()) {
            $applicationFeedback->setApplication($application);
            $applicationFeedback->setCreatedAt(new \DateTime());
            $applicationFeedback->setFeedbackFrom($this->getUser());
            $entityManager->persist($applicationFeedback);
            $entityManager->flush();
            // dd();
            $seroHelper->appHistory($application, "A new feedback message has been sent  ", 'info', 'paper-plane');

            return $this->redirectToRoute(
                'application_show',
                ["uid" => $application->getUid()],
                Response::HTTP_SEE_OTHER
            );
        }
        ///discussion

        $irb_review_checklist_group = $entityManager->getRepository(ReviewChecklistGroup::class)->findAll();
        $meetings = $entityManager->getRepository(MeetingSchedule::class)->findUpcomingSchedules();
        $decisions = $entityManager->getRepository(DecisionType::class)->findAll();
        ///
        $ammendment = new Amendment;
        $ammendmentForm = $this->createForm(AmendmentType::class, $ammendment);
        ///
        ///
        $contuoation = new Continuation;
        $contuoationForm = $this->createForm(ContinuationType::class, $contuoation);
        ///
        ///
        $icf = new Icf;
        $icfForm = $this->createForm(IcfType::class, $icf);
        $icfForm->handleRequest($request);

        if ($icfForm->isSubmitted() && $icfForm->isValid()) {
            $icf->setApplication($application);
            $icf->setCreatedAt(new \DateTime());
            $icf->setVersionNumber($seroHelper->icfVersion($application));

            if ($icfForm->get('attachment')->getData()) {
                $ver = $icfForm->getData();
                $icfAttachement = $icfForm->get('attachment')->getData();
                $icfFileName = $seroHelper->icfFileNamer($ver) . $icfAttachement->guessExtension();
                $icfAttachement->move($this->getParameter('uploads_folder'), $icfFileName);
                $icf->setAttachment($icfFileName);
            }
            $seroHelper->appHistory($application, "A Continuation request has been sent ", 'success', 'paper-plane');

            $entityManager->persist($icf);
            $entityManager->flush();

            return $this->redirectToRoute(
                'application_show',
                ["uid" => $application->getUid()],
                Response::HTTP_SEE_OTHER
            );
        }
        ///
        return $this->render('sero/application/details.html.twig', [
            'appfeedbfrom' => $feedbackForm->createView(),
            'ammendmentForm' => $ammendmentForm->createView(),
            'irb_review_checklist_group' => $irb_review_checklist_group,
            'form' => $versionForm,
            'meetings' => $meetings,
            'contuoationForm' => $contuoationForm,
            'decisions' => $decisions,
            'icfForm' => $icfForm,
            'application' => $application,
            'versions' => array_reverse($existingVersion),
        ]);
    }

    #[Route('/{id}/addicf', name: 'add_icf', methods: ['POST'])]
    public function addicf(Request $request, SEROHelper $seroHelper, EntityManagerInterface $entityManager, Application $application): Response
    {
        $icf = new Icf;
        $icfForm = $this->createForm(IcfType::class, $icf);
        $icfForm->handleRequest($request);

        if ($icfForm->isSubmitted() && $icfForm->isValid()) {
            $icf->setApplication($application);
            $icf->setCreatedAt(new \DateTime());
            $icf->setVersionNumber($seroHelper->icfVersion($application));
            dd($icfForm->get('attachment')->getData());
            if ($icfForm->get('attachment')->getData()) {
                $ver = $icfForm->getData();
                $icfAttachement = $icfForm->get('attachment')->getData();
                $icfFileName = $seroHelper->icfFileNamer($ver) . $icfAttachement->guessExtension();
                $icfAttachement->move($this->getParameter('uploads_folder'), $icfFileName);
                $icf->setAttachment($icfFileName);
            }

            $entityManager->persist($icf);
            $entityManager->flush();

            return $this->redirectToRoute(
                'application_show',
                ["uid" => $application->getUid()],
                Response::HTTP_SEE_OTHER
            );
        }
        ///
        return $this->render('sero/application/details.html.twig', [
            'icfForm' => $icfForm,
            'application' => $application,
        ]);
    }


    #[Route('/{uid}/removeAttachment', name: 'remove_attachment', methods: ['GET', 'POST'])]
    public function deleteatt(Request $request, Attachment $attachment, EntityManagerInterface $entityManager): Response
    {
        $app = $attachment->getProtocol()->getUid();

        // if ($this->isCsrfTokenValid('delete'.$attachment->getId(), $request->getPayload()->getString('_token'))) {
        $entityManager->remove($attachment);
        $entityManager->flush();
        // }
        // dd($app);
        return $this->redirectToRoute('protocol_application_update', ['uid' => $app], Response::HTTP_SEE_OTHER);
    }

    #[Route('/{id}/export',   name: 'export', methods: ['GET', 'POST'])]

    public function exportnow(EntityManagerInterface $em, Application $uid)
    {

        $submission = $em->getRepository(Application::class)->findOneBy(['id' => $uid->getId()]);
        // Configure Dompdf according to your needs
        $pdfOptions = new Options();
        $pdfOptions->set('defaultFont', 'Arial');
        $pdfOptions->set('isRemoteEnabled', true);
        $data = file_get_contents('files/site_setting/ephi2.jpg');
        $type = 'png';
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
        $pdfOptions->set('tempDir', '/home/cornerstone/tmp');
        // Instantiate Dompdf with our options
        $dompdf = new Dompdf($pdfOptions);
        $dompdf->set_option("isPhpEnabled", true);
        $html = $this->renderView('sero/application/cert2.html.twig', [
            'user' => $this->getUser(),
            'orglogos' => $base64,
            // 'application' => $app,
            'base64' => $base64,
            'application' => $submission,
        ]);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();
        $font = $dompdf->getFontMetrics()->get_font("helvetica", "bold");
        $font = null;
        $dompdf->getCanvas()->page_text(72, 18, "Page: {PAGE_NUM} of {PAGE_COUNT}", $font, 10, array(0, 0, 0));
        ob_end_clean();
        $filename = $submission->getTitle();
        $dompdf->stream($filename . "file.pdf", [
            "Attachment" => false,
        ]);
    }

    ///// Download any fiile attachment
    #[Route('/{filename}/download',   name: 'download', methods: ['POST'])]
    public function download(Request $request, $filename)
    {

        $this->denyAccessUnlessGranted('ROLE_USER');
        if (!$request) {
            $this->addFlash("danger", "The requested file could not be found!");
        }
        if ($filename) {
            return $this->file($this->getParameter('uploads_folder') . '/' . $filename);
        } else {
            $this->addFlash("danger", "The requested file could not be found!");
        }
    }


    #[Route('/{id}/edit', name: 'application_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Application $application, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ApplicationType::class, $application);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('application_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/application/edit.html.twig', [
            'application' => $application,
            'form' => $form,
        ]);
    }


    #[Route('/{id}/{dec}', name: 'initial_decision', methods: ['GET', 'POST'])]
    public function decide(DecisionType  $dec, Application $app, EntityManagerInterface $entityManager, SEROHelper $seroHelper): Response
    {

        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        // $app =  $version->getApplication();
        $app->setReviewMode($dec);
        $entityManager->persist($app);
        $entityManager->flush();
        $this->addFlash("success", "The review mode of protocol version set to " . $dec->getName() . " decision !");
        $seroHelper->appHistory($app, "A review type Decision on initial has been made ", 'warning', 'pin');

        return $this->redirectToRoute(
            'application_show',
            ["uid" => $app->getUid()],
            Response::HTTP_SEE_OTHER
        );
        // return $this->redirectToRoute('application_index', [], Response::HTTP_SEE_OTHER);
    }



    #[Route('/{uid}', name: 'application_delete', methods: ['POST'])]
    public function delete(Request $request, Application $application, EntityManagerInterface $entityManager, SEROHelper $seroHelper): Response
    {
        if ($this->isCsrfTokenValid('delete' . $application->getUid(), $request->getPayload()->get('_token'))) {
            $withdrawStatus = $entityManager->getRepository(Status::class)->findOneBy(['code' => 'WITHDRAWN']);
            $application->setStatus($withdrawStatus);
            $entityManager->persist($application);
            $entityManager->flush();
            $seroHelper->appHistory($application, "Application has been withdrawn ", 'danger', 'trash');
            $this->addFlash("success", "The Protocol has been withdrawn!");
        }

        return $this->redirectToRoute(
            'application_show',
            ["uid" => $application->getUid()],
            Response::HTTP_SEE_OTHER
        );
    }
}
