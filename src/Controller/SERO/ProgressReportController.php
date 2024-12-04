<?php

namespace App\Controller\SERO;

use App\Entity\SERO\Application;
use App\Entity\SERO\ProgressReport;
use App\Form\SERO\ProgressReportType;
use App\Helper\SEROHelper;
use App\Repository\SERO\ProgressReportRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('{_locale<%app.supported_locales%>}/progress-report')]

class ProgressReportController extends AbstractController
{
    #[Route('/', name: 'app_s_e_r_o_progress_report_index', methods: ['GET'])]
    public function index(ProgressReportRepository $progressReportRepository): Response
    {
        return $this->render('sero/progress_report/index.html.twig', [
            'progress_reports' => $progressReportRepository->findAll(),
        ]);
    }

    #[Route('/{uid}/new', name: 'progress_report_new', methods: ['GET', 'POST'])]
    public function new(Application $application, SEROHelper $seroHelper, Request $request, EntityManagerInterface $entityManager): Response
    {
        $progressReport = new ProgressReport();
        $form = $this->createForm(ProgressReportType::class, $progressReport);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $progressReport->setProtocol($application);
            $progressReport->setSubmittedBy($this->getUser());
            $progressReport->setSubmittedAt(new \DateTime());
          
            if ($form->get('attachment')->getData()) {
                $ver = $form->getData();
                $progressReportAttachement = $form->get('attachment')->getData();
                $progressReportFileName = $application->getIbcode()."-Progress_Report." . $progressReportAttachement->guessExtension();
                $progressReportAttachement->move($this->getParameter('uploads_folder'), $progressReportFileName);
                $progressReport->setAttachment($progressReportFileName);
            }

            $seroHelper->appHistory($application, "Progress report has been sent ", 'primary', 'layers');

            $entityManager->persist($progressReport);
            $entityManager->flush();

            return $this->redirectToRoute(
                'application_show',
                ["uid" => $application->getUid()],
                Response::HTTP_SEE_OTHER
            );        }

        return $this->render('sero/progress_report/new.html.twig', [
            'progress_report' => $progressReport,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_s_e_r_o_progress_report_show', methods: ['GET'])]
    public function show(ProgressReport $progressReport): Response
    {
        return $this->render('sero/progress_report/show.html.twig', [
            'progress_report' => $progressReport,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_s_e_r_o_progress_report_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, ProgressReport $progressReport, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ProgressReportType::class, $progressReport);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_progress_report_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/progress_report/edit.html.twig', [
            'progress_report' => $progressReport,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_s_e_r_o_progress_report_delete', methods: ['POST'])]
    public function delete(Request $request, ProgressReport $progressReport, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$progressReport->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($progressReport);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_s_e_r_o_progress_report_index', [], Response::HTTP_SEE_OTHER);
    }
}
