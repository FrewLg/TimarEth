<?php

namespace App\Controller\SERO;

use App\Entity\SERO\Attachment;
use App\Form\SERO\AttachmentType;
use App\Repository\SERO\AttachmentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/s/e/r/o/attachment')]
final class AttachmentController extends AbstractController
{
    #[Route(name: 'app_s_e_r_o_attachment_index', methods: ['GET'])]
    public function index(AttachmentRepository $attachmentRepository): Response
    {
        return $this->render('sero/attachment/index.html.twig', [
            'attachments' => $attachmentRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_s_e_r_o_attachment_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $attachment = new Attachment();
        $form = $this->createForm(AttachmentType::class, $attachment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($attachment);
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_attachment_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/attachment/new.html.twig', [
            'attachment' => $attachment,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_s_e_r_o_attachment_show', methods: ['GET'])]
    public function show(Attachment $attachment): Response
    {
        return $this->render('sero/attachment/show.html.twig', [
            'attachment' => $attachment,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_s_e_r_o_attachment_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Attachment $attachment, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(AttachmentType::class, $attachment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_attachment_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/attachment/edit.html.twig', [
            'attachment' => $attachment,
            'form' => $form,
        ]);
    }

//     #[Route('/{id}/del', name: 'remove_attachment', methods: ['POST'])]
//     public function delete(Request $request, Attachment $attachment, EntityManagerInterface $entityManager): Response
//     {
//         $app=$attachment->getProtocol()->getUid();

//         // if ($this->isCsrfTokenValid('delete'.$attachment->getId(), $request->getPayload()->getString('_token'))) {
//             $entityManager->remove($attachment);
//             $entityManager->flush();
//         // }
// dd();
//         return $this->redirectToRoute('protocol_application_update', ['uid'=>$app], Response::HTTP_SEE_OTHER);
//     }


    
}
