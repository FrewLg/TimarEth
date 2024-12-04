<?php

namespace App\Controller;

use App\Entity\Compliant;
use App\Form\Compliant1Type;
use App\Repository\CompliantRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

// #[Route('/compliant')]
#[Route('{_locale<%app.supported_locales%>}/compliants')]

class CompliantController extends AbstractController
{
    #[Route('/', name: 'app_compliant_index', methods: ['GET'])]
    public function index(CompliantRepository $compliantRepository): Response
    {
        return $this->render('compliant/index.html.twig', [
            'compliants' => $compliantRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_compliant_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $compliant = new Compliant();
        $form = $this->createForm(Compliant1Type::class, $compliant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($compliant);
            $entityManager->flush();

            return $this->redirectToRoute('app_compliant_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('compliant/new.html.twig', [
            'compliant' => $compliant,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_compliant_show', methods: ['GET'])]
    public function show(Compliant $compliant): Response
    {
        return $this->render('compliant/show.html.twig', [
            'compliant' => $compliant,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_compliant_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Compliant $compliant, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(Compliant1Type::class, $compliant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_compliant_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('compliant/edit.html.twig', [
            'compliant' => $compliant,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_compliant_delete', methods: ['POST'])]
    public function delete(Request $request, Compliant $compliant, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$compliant->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($compliant);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_compliant_index', [], Response::HTTP_SEE_OTHER);
    }
}
