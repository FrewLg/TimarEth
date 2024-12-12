<?php

namespace App\Controller\Timar;

use App\Entity\Timar\Opportunity;
use App\Form\Timar\OpportunityType;
use App\Repository\Timar\OpportunityRepository;
use Doctrine\ORM\EntityManagerInterface;
use EnchantDictionary;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

// #[Route('/timar/opportunity')]
#[Route('{_locale<%app.supported_locales%>}/adm/opportunity')]
// #[Route('/opportunity')]

final class OpportunityController extends AbstractController
{
   

    #[Route('/new', name: 'app_timar_opportunity_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $opportunity = new Opportunity();
        $form = $this->createForm(OpportunityType::class, $opportunity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $opportunity->setPostedDate(new \DateTime());
            $opportunity->setUid(md5(uniqid()));

            $entityManager->persist($opportunity);
            $entityManager->flush();

            return $this->redirectToRoute('app_timar_opportunity_new', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('timar/opportunity/new.html.twig', [
            'opportunitys' => $opportunity,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_timar_opportunity_show', methods: ['GET'])]
    public function show(Opportunity $opportunity): Response
    {
        return $this->render('timar/opportunity/show.html.twig', [
            'opportunity' => $opportunity,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_timar_opportunity_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Opportunity $opportunity, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(OpportunityType::class, $opportunity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_timar_opportunity_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('timar/opportunity/edit.html.twig', [
            'opportunity' => $opportunity,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_timar_opportunity_delete', methods: ['POST'])]
    public function delete(Request $request, Opportunity $opportunity, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$opportunity->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($opportunity);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_timar_opportunity_index', [], Response::HTTP_SEE_OTHER);
    }
}
