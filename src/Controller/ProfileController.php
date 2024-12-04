<?php

namespace App\Controller;

use App\Entity\Profile;
use App\Form\FileUploadType;
use App\Form\ProfileType;
use App\Form\SignatureUploadType;
use App\Form\UserProfilePictureType;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('{_locale<%app.supported_locales%>}/profile')]
class ProfileController extends AbstractController
{

    #[Route('/', name: 'my_profile', methods: ['GET', 'POST'])]
    public function userprofile(Request $request, EntityManagerInterface $entityManager): Response
    {
        $this->denyAccessUnlessGranted("ROLE_USER");
        $user = $this->getUser();
        if ($this->getUser()->getProfile()) {
            $user = $user->getProfile();
        } else {

            $user = new Profile();
            $user->setUser($this->getUser());
        }

        $form = $this->createForm(ProfileType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user->setUser($this->getUser());

             

            $entityManager->persist($user);

            $entityManager->flush();
            $this->addFlash('success', "Your personal information has been updated successfully!");

            return $this->redirectToRoute('my_profile');
        }
        $profile = $this->getUser()->getProfile();
        $profilepictureform = $this->createForm(UserProfilePictureType::class, $profile);
        $profilepictureform->handleRequest($request);
        // dd();
        if ($profilepictureform->isSubmitted() && $profilepictureform->isValid()) {
            $prifilepicture = $profilepictureform->get('image')->getData();
            $file = $profilepictureform->get('image')->getData();


            // if ($prifilepicture == NULL) {
            //     // echo 'Image not uploaded';
            //     $prifilepicture = '';
            // } else {
            //     $fileName3 = 'PP-' .  md5(uniqid()) . '.' . $prifilepicture->guessExtension();
            //     $prifilepicture->move($this->getParameter('profile_pictures'), $fileName3);
            //     $profile->setImage($fileName3);
            //     $entityManager->persist($profile);
            //     $entityManager->flush();
            //     $this->addFlash('success', "Profile picture has been changed successfully!   ");
            // }
            // $file = $request->files->get('file');

            if ($file) {
                $fileName = uniqid() . '.' . $file->guessExtension();
                $uploadDir = $this->getParameter('profile_pictures'); // Adjust as needed

                if (!is_dir($uploadDir)) {
                    mkdir($uploadDir, 0777, true);
                }

                $file->move($uploadDir, $fileName);
                $profile->setImage($fileName);
                $entityManager->persist($profile);
                $entityManager->flush();

                return new JsonResponse(['message' => 'File uploaded successfully']);
            }

            return new JsonResponse(['error' => 'No file uploaded'], 400);
        }
        return $this->render('user/profile.html.twig', [
            'user' => $user,
            'allform' => $form->createView(),
            'profileform' => $profilepictureform->createView(),
        ]);
    }


    #[Route('/signature', name: 'upload_signature', methods: ['GET', 'POST'])]
    public function userprofilesecond(Request $request, EntityManagerInterface $entityManager): Response
    {
        $this->denyAccessUnlessGranted("ROLE_USER");
        $user = $this->getUser();
        if ($this->getUser()->getProfile()) {
            $user = $user->getProfile();
        } else {

            $user = new Profile();
            $user->setUser($this->getUser());
        }

        $form = $this->createForm(SignatureUploadType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $user->setUser($this->getUser());

            $file = $form->get('signature')->getData();

            return $this->redirectToRoute('my_profile');
        }

        return $this->render('user/progressProfile.html.twig', [
            'user' => $user,
            'form' => $form->createView(),

        ]);
    }

    #[Route('/uploadnew', name: 'profile_upload', methods: ['POST'])]
    public function upload(Request $request, EntityManagerInterface $entityManager,  LoggerInterface $logger): Response
    {

        $file = $request->files->get('file');
        // $file = $request->request->files->get('file');
        // $file = $request->get('signature')->getData();
        // dd($file);
        $user = $this->getUser();
        if ($this->getUser()->getProfile()) {
            $profile = $user->getProfile();
        } else {

            $user = new Profile();
            $user->setUser($this->getUser());
        }

        if ($file) {
            // $fileName = uniqid() . '.' . $file->guessExtension();
            $fileName = 'SG-' .  md5(uniqid()) . '.' . $file->guessExtension();
            $uploadDir = $this->getParameter('signatures'); // Adjust as needed signatures  profile_pictures
            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0777, true);
            }

            try {
                // Your file upload logic here...
                $file->move($uploadDir, $fileName);
                $profile->setSignature($fileName);
                // $signatureName = 'SG-' .  md5(uniqid()) . '.' . $signature->guessExtension();

                $entityManager->persist($profile);
                $entityManager->flush();
                $logger->info('File uploaded successfully: ' . $fileName);
                // $this->addFlash('success', "Profile picture has been changed successfully!   ");
                return new JsonResponse(['message' => 'File uploaded successfully'], 200);
            } catch (\Exception $e) {
                // Log the exception for debugging
                $logger->error('File upload error: ' . $e->getMessage());
                $this->addFlash('danger', "Oops signature has not been updated !   ");

                return new JsonResponse(['error' => $e->getMessage()], 500); // Or a more user-friendly error message
            }
        }

        return new JsonResponse(['error' => 'No file uploaded'], 400);
    }
}
