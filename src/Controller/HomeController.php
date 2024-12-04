<?php

namespace App\Controller;

use App\Entity\Compliant;
use App\Entity\SERO\IrbCertificate;
use Symfony\Component\Translation\LocaleSwitcher;
use App\Entity\TrainingParticipant;
use App\Form\CompliantType;
use App\Form\TrainingParticipantType;
use App\Repository\SERO\BoardMemberRepository;
use App\Repository\TrainingParticipantRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Dompdf\Dompdf;
use Skies\QRcodeBundle\Generator\Generator;
use Dompdf\Options;
use Symfony\Contracts\Translation\TranslatorInterface;
use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
// use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelLow;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Writer\PngWriter;

class HomeController extends AbstractController
{
    #[Route('{_locale<%app.supported_locales%>}/', name: 'homepage')]
    public function index(
        TranslatorInterface $translator,
        Request $request,
        LocaleSwitcher $localeSwitcher
    ): Response {
        // Set the active locale to German
        $localeSwitcher->setLocale('en');

        // Retrieve the active locale
        // $localeSwitcher->getLocale(); // => 'de'

        $locale = $request->getLocale();
        $mess = "Welcome";
        return $this->render('homepage/index.html.twig', [
            'msg' => $mess,
            'locale' => $locale,
        ]);
    }

    #[Route('{_locale<%app.supported_locales%>}/boardMembers', name: 'boardMembers')]
    public function boardMembers(
        Request $request,
        BoardMemberRepository $boardMemberRepository, 
        ): Response {
        // Set the active locale to German
        $boardMembers= $boardMemberRepository->findAll();
        
        return $this->render('homepage/boardMembers.html.twig', [

            'boardMembers' => $boardMembers,
        ]);
    }


    #[Route('{_locale<%app.supported_locales%>}/about', name: 'about')]
    public function about(
        Request $request,
        BoardMemberRepository $boardMemberRepository, 
        ): Response {
        // Set the active locale to German
         
        return $this->render('homepage/about.html.twig', [

             
        ]);
    }

    // #[Route('{_locale<%app.supported_locales%>}/irb-clearancdesd/{certificateCode}', name: 'irb_validate2')]
    #[Route('{_locale<%app.supported_locales%>}/irb-clearance/', name: 'irb_validate', methods: ['GET', 'POST'])]
    public function home(Request $request, EntityManagerInterface $em, IrbCertificate $irbCertificate = null): Response
    {
        $sentCode = $request->request->get('validate');
        if ($sentCode) {
            $irbCertificate = $em->getRepository(IrbCertificate::class)
                ->findOneBy(['certificateCode' => $sentCode]);
            if (!$irbCertificate) {
                $this->addFlash('danger', 'No IRB clearance was issued with "'
                    . $sentCode . '" code');
            } else {

                $this->addFlash('success', ' IRB ethical clearance certificate  found "');
                $srringToGenerate = "Researcher:" . $irbCertificate->getIrbApplication()->getSubmittedBy() . "Protocol Number:" . $irbCertificate->getIrbApplication()->getIbcode() . "Cerificate Number:" . $irbCertificate->getcertificateCode();

                $qrCode = Builder::create()
                    ->writer(new PngWriter())
                    ->writerOptions([])
                    ->data($srringToGenerate)
                    ->encoding(new Encoding('UTF-8'))
                    ->size(300)
                    ->margin(10)
                    ->build();

                return $this->render('sero/clearance.html.twig', [
                    'qr_code' => $qrCode->getDataUri(),
                    'irb' => $irbCertificate
                ]);
            }
        }

        return $this->render('sero/clearance.html.twig', []);
    }

    #[Route('{_locale<%app.supported_locales%>}/verify-here/{certificateCode}', name: 'verify_by_link', methods: ['GET', 'POST'])]
    public function clicktlinkoverify(EntityManagerInterface $em,   $certificateCode): Response
    {

        $irbCertificate = $em->getRepository(IrbCertificate::class)->findOneBy(['certificateCode' => $certificateCode]);
        if (!$irbCertificate) {
            $this->addFlash('danger', 'No IRB clearance was issued with the code: ' . $certificateCode . "!");
        } else {

            $this->addFlash('success', 'Valid IRB ethical clearance certificate');
            $srringToGenerate = $irbCertificate->getcertificateCode();
            $srringToGenerate = "Researcher:" . $irbCertificate->getIrbApplication()->getSubmittedBy() .
                "Protocol Number:" . $irbCertificate->getIrbApplication()->getIbcode() .
                "Cerificate Number:" . $irbCertificate->getcertificateCode();

            $qrCode = Builder::create()
                ->writer(new PngWriter())
                ->writerOptions([])
                ->data($srringToGenerate)
                ->encoding(new Encoding('UTF-8'))
                ->size(300)
                ->margin(10)
                ->build();

            return $this->render('sero/clearance.html.twig', [
                'barcode' => $qrCode->getDataUri(),
                'qr_code' => $qrCode->getDataUri(),
                'irb' => $irbCertificate
            ]);
        }

        return $this->render('sero/clearance.html.twig', []);
    }

    #[Route('{_locale<%app.supported_locales%>}/compliant', name: 'compliant', methods: ['GET','POST'])]
    public function compliants(EntityManagerInterface $entityManager, Request $request): Response
    {

        $compliant= new Compliant();
        $form = $this->createForm(CompliantType::class, $compliant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $compliant->setCreatedAt(new \DateTime());
            
            $entityManager->persist($compliant);
            $entityManager->flush();
            $this->addFlash("success", "Your compliant has been received. We will reach you out soon. Thank you!");
 
            return $this->redirectToRoute('homepage', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/compliantForm.html.twig', [
            'compliant' => $compliant,
            'form' => $form,
        ]);

     }

    #[Route('{_locale<%app.supported_locales%>}/developers', name: 'developers', methods: ['GET'])]
    public function developers(): Response
    {

        return $this->render('sero/developers.html.twig', []);
    }
}
