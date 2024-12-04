<?php

namespace App\Controller\SERO;

use App\Entity\SERO\Application;
use App\Entity\SERO\MeetingSchedule;
use App\Entity\SERO\Status;
use App\Form\SERO\MeetingScheduleType;
use App\Helper\SEROHelper;
use App\Repository\SERO\MeetingScheduleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Intervention\Image\Colors\Rgb\Channels\Red;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

// #[Route('/s//meeting-schedule')]
#[Route('{_locale<%app.supported_locales%>}/meeting-schedule')]

class MeetingScheduleController extends AbstractController
{
    #[Route('/{id}/meetings', name: 'smeetings', methods: ['GET'])]
    public function index(MeetingScheduleRepository $meetingScheduleRepository): Response
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');

        return $this->render('sero/meeting_schedule/index.html.twig', [
            'meeting_schedules' => $meetingScheduleRepository->findAll(),
        ]);
    }

    #[Route('/', name: 'meeting_schedule', methods: ['GET', 'POST'])]
    public function schedule(Request $request, MeetingScheduleRepository $meetingScheduleRepository, EntityManagerInterface $entityManager): Response
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');

        // $this->denyAccessUnlessGranted('ROLE_ADMIN');

        $meetingSchedule = new MeetingSchedule();
        $form = $this->createForm(MeetingScheduleType::class, $meetingSchedule);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($meetingSchedule);
            $entityManager->flush();

            return $this->redirectToRoute('meeting_schedule', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/meeting_schedule/calendar.html.twig', [
            'meeting_schedules' => array_reverse($meetingScheduleRepository->findAll()),
            'form' => $form,
            // 'trainings' => $meetingScheduleRepository->findAll(),
        ]);
    }



    #[Route('/{id}/edit', name: 'meeting_schedule_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request,MeetingSchedule $meeting, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(MeetingScheduleType::class, $meeting);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('meeting_schedule', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/meeting_schedule/edit.html.twig', [
            'meeting_schedules' => $meeting,
            'form' => $form,
        ]);
    }


    #[Route('/{id}', name: 'meeting_schedule_show', methods: ['GET'])]
    public function show(MeetingSchedule $meetingSchedule): Response
    {
        return $this->render('sero/meeting_schedule/show.html.twig', [
            'meeting_schedule' => $meetingSchedule,
        ]);
    }

    #[Route('/{uid}/send', name: 'meeting_schedule_add_protocol', methods: ['POST'])]
    public function addToMeeting(Request $request, SEROHelper $seroHelper,   Application $application, MeetingScheduleRepository $meetingScheduleRepository, EntityManagerInterface $entityManager): Response
    {

 
        $meetingScheduleid = $request->get('schedule_id');
         if ($meetingScheduleid != "") {
            $meetingSchedule = $meetingScheduleRepository->findOneBy(['id' => $meetingScheduleid]);
            $application->addMeetingSchedule($meetingSchedule);
            $meetingSchedule->addSentProtocol($application);
            $seroHelper->appHistory($application, "Application has been added to  meeting agenda ".$meetingSchedule->getName()."", 'info', 'layers');
            $appStatus = $entityManager->getRepository(Status::class)->findOneBy(['code' => 'SENT_TO_MEETING']);
            $application->setStatus($appStatus);

            $entityManager->persist($application);
            $entityManager->persist($meetingSchedule);
            $entityManager->flush();
            $this->addFlash("success", "The Protocol has been added to " . $meetingSchedule->getName()." meeting schedule!");
          
        }
        return $this->redirectToRoute(
            'application_show',
            ["uid" => $application->getUid()],
            Response::HTTP_SEE_OTHER
        );
    }

    #[Route('/{id}', name: 'meeting_schedule_delete', methods: ['POST'])]
    public function delete(Request $request, MeetingSchedule $meetingSchedule, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $meetingSchedule->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($meetingSchedule);
            $entityManager->flush();
        }

        return $this->redirectToRoute('meeting_schedule_index', [], Response::HTTP_SEE_OTHER);
    }
}
