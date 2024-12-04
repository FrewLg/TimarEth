<?php

namespace App\Controller\SERO;

use App\Entity\SERO\ReviewerRecommendation;
use App\Form\SERO\ReviewerRecommendationType;
use App\Repository\SERO\ReviewerRecommendationRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('{_locale<%app.supported_locales%>}/setting/recommendation')]

class ReviewerRecommendationController extends AbstractController
{
    #[Route('/', name: 'app_s_e_r_o_reviewer_recommendation_index', methods: ['GET'])]
    public function index(ReviewerRecommendationRepository $reviewerRecommendationRepository): Response
    {
        return $this->render('sero/reviewer_recommendation/index.html.twig', [
            'reviewer_recommendations' => $reviewerRecommendationRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_s_e_r_o_reviewer_recommendation_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $reviewerRecommendation = new ReviewerRecommendation();
        $form = $this->createForm(ReviewerRecommendationType::class, $reviewerRecommendation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($reviewerRecommendation);
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_reviewer_recommendation_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/reviewer_recommendation/new.html.twig', [
            'reviewer_recommendation' => $reviewerRecommendation,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_s_e_r_o_reviewer_recommendation_show', methods: ['GET'])]
    public function show(ReviewerRecommendation $reviewerRecommendation): Response
    {
        return $this->render('sero/reviewer_recommendation/show.html.twig', [
            'reviewer_recommendation' => $reviewerRecommendation,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_s_e_r_o_reviewer_recommendation_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, ReviewerRecommendation $reviewerRecommendation, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ReviewerRecommendationType::class, $reviewerRecommendation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_reviewer_recommendation_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/reviewer_recommendation/edit.html.twig', [
            'reviewer_recommendation' => $reviewerRecommendation,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_s_e_r_o_reviewer_recommendation_delete', methods: ['POST'])]
    public function delete(Request $request, ReviewerRecommendation $reviewerRecommendation, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$reviewerRecommendation->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($reviewerRecommendation);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_s_e_r_o_reviewer_recommendation_index', [], Response::HTTP_SEE_OTHER);
    }
}
