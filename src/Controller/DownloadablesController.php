<?php

namespace App\Controller;

use App\Entity\Downloadables;
use App\Form\DownloadablesType;
use App\Repository\DownloadablesRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;


#[Route('{_locale<%app.supported_locales%>}/downloads')]

class DownloadablesController extends AbstractController
{
    #[Route('/', name: 'app_downloadables_index', methods: ['GET'])]
    public function index(DownloadablesRepository $downloadablesRepository): Response
    {
        return $this->render('downloadables/index.html.twig', [
            'downloadables' => $downloadablesRepository->findAll(),
        ]);
    }

    #[Route('/admn', name: 'app_downloadables', methods: ['GET'])]
    public function admin(DownloadablesRepository $downloadablesRepository): Response
    {
        return $this->render('downloadables/index.html.twig', [
            'downloadables' => $downloadablesRepository->findAll(),
        ]);
    }
    #[Route('/new', name: 'app_downloadables_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $downloadable = new Downloadables();
        $form = $this->createForm(DownloadablesType::class, $downloadable);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            if ($form->get('attachment')->getData()) {
                $downloadableFile = $form->get('attachment')->getData();
                $name = $form->get('name')->getData();
                $downloadableFileName = $name . md5(uniqid()) . '.' . $downloadableFile->guessExtension();
                $downloadableFile->move($this->getParameter('downloadable_templates'), $downloadableFileName);
                $downloadable->setAttachment($downloadableFileName);
            }
            $downloadable->setCreatedAt(new \DateTime());
            $downloadable->setUploadedBy($this->getUser());

            $entityManager->persist($downloadable);
            $entityManager->flush();

            return $this->redirectToRoute('app_downloadables_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('downloadables/new.html.twig', [
            'downloadable' => $downloadable,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_downloadables_show', methods: ['GET'])]
    public function show(Downloadables $downloadable): Response
    {
        return $this->render('downloadables/show.html.twig', [
            'downloadable' => $downloadable,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_downloadables_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Downloadables $downloadable, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(DownloadablesType::class, $downloadable);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_downloadables_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('downloadables/edit.html.twig', [
            'downloadable' => $downloadable,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_downloadables_delete', methods: ['POST'])]
    public function delete(Request $request, Downloadables $downloadable, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$downloadable->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($downloadable);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_downloadables_index', [], Response::HTTP_SEE_OTHER);
    }
}
