<?php

namespace App\Controller;

use App\Entity\Compliant;
use App\Entity\SERO\IrbCertificate;
use App\Entity\Timar\Opportunity;
use App\Form\CompliantType; 
use App\Repository\SERO\BoardMemberRepository;
use App\Repository\Timar\OpportunityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route; 
use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding; 
use Endroid\QrCode\Writer\PngWriter;
use Symfony\Component\HttpFoundation\JsonResponse;

#[Route('{_locale<%app.supported_locales%>}/')]

class HomeController extends AbstractController
{
    
    protected EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }


    #[Route('/', name: 'homepage')]

    public function index(): Response
    {
        return $this->renderWithOpportunities('homelayout.html.twig');
    }


    #[Route('/ne', name: 'app_timar_opportunity_index', methods: ['GET'])]
    public function indexadmin(OpportunityRepository $opportunityRepository): Response
    {
        return $this->render('timar/opportunity/index.html.twig', [
            'opportunities' => $opportunityRepository->findAll(),
        ]);
    }


    
    // #[Route('/', name: '')]
    #[Route('/opportunities', name: 'opportunity_list', methods: ['GET'])]

    public function indextwo(EntityManagerInterface $entityManager)
    {
        // Load the first batch of opportunities
        $opportunities = $entityManager->getRepository(Opportunity::class)->findBy([], null, 3);

        return $this->renderWithOpportunities('timar/opportunity/index.html.twig', [
            'opportunities' => $opportunities,
            // 'opportunities' => $opportunities,
        ]);
    }


    #[Route('/allopportunitiess', name: 'all_opportunity_list')]
    public function listtwo(EntityManagerInterface $entityManager): Response
    {
        return $this->render('opportunity/list.html.twig', $this->getGlobalData());
        // return $this->renderWithOpportunities('timar/opportunity/list.html.twig');
    }

    
    protected function renderWithOpportunities(string $view,  array $parameters = [], int $limit = 3)
{
    $parameters['opportunities'] = $this->entityManager->getRepository(Opportunity::class)->getRecentOpportunities($limit);
    // Debug log
    dump($parameters['opportunities']); // This will output the opportunities
    return $this->render($view, $parameters);
}

    #[Route('/opportunities/load', name: 'opportunity_load', methods: ['GET'])]
    public function loadMoreOpportunities(Request $request)
    {
        $offset = (int) $request->query->get('offset', 0);
        $opportunities = $this->entityManager->getRepository(Opportunity::class)->findBy([], null, 4, $offset);

        // Convert opportunities to an array for JSON response
        $data = [];
        foreach ($opportunities as $opportunity) {
            $data[] = [
                'title' => $opportunity->getTitle(),
                'description' => $opportunity->getDescription(),
                'link' => $opportunity->getLink(),
            ];
        }

        return new JsonResponse($data);
    }

    


    #[Route('/about', name: 'about')]
    public function about(
        Request $request,
        BoardMemberRepository $boardMemberRepository, 
        ): Response {
        // Set the active locale to German
         
        return $this->render('homepage/about.html.twig', [

             
        ]);
    }

    
    #[Route('/compliant', name: 'compliant', methods: ['GET','POST'])]
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

    #[Route('/developers', name: 'developers', methods: ['GET'])]
    public function developers(): Response
    {

        return $this->render('sero/developers.html.twig', []);
    }
}
