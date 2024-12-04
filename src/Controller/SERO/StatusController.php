<?php

namespace App\Controller\SERO;

use App\Entity\SERO\Status;
use App\Form\SERO\StatusType;
use App\Repository\SERO\StatusRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('{_locale<%app.supported_locales%>}/setting/status')]

class StatusController extends AbstractController
{
    #[Route('/', name: 'app_s_e_r_o_status_index', methods: ['GET'])]
    public function index(StatusRepository $statusRepository): Response
    {
        return $this->render('sero/status/index.html.twig', [
            'statuses' => $statusRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_s_e_r_o_status_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $status = new Status();
        $form = $this->createForm(StatusType::class, $status);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($status);
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_status_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/status/new.html.twig', [
            'status' => $status,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_s_e_r_o_status_show', methods: ['GET'])]
    public function show(Status $status): Response
    {
        return $this->render('sero/status/show.html.twig', [
            'status' => $status,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_s_e_r_o_status_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Status $status, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(StatusType::class, $status);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_status_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/status/edit.html.twig', [
            'status' => $status,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_s_e_r_o_status_delete', methods: ['POST'])]
    public function delete(Request $request, Status $status, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$status->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($status);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_s_e_r_o_status_index', [], Response::HTTP_SEE_OTHER);
    }
}
