<?php

namespace App\Controller\SERO;

use App\Entity\ActionAudit;
use App\Entity\ReviewRecommendation;
use App\Entity\SERO\Application;
use App\Entity\SERO\Amendment;
use App\Entity\SERO\ApplicationFeedback;
use App\Entity\SERO\Continuation;
use App\Entity\SERO\DecisionType;
use App\Entity\SERO\Icf;
use App\Entity\SERO\IrbCertificate;
use App\Entity\SERO\ReviewChecklistGroup;
use App\Form\SERO\ReviewChecklistGroupType;
use App\Entity\SERO\ReviewAssignment;
use App\Entity\SERO\ReviewerResponse;
use App\Entity\SERO\ReviewChecklist;
use App\Entity\SERO\ReviewerRecommendation;
use App\Entity\SERO\ReviewType;
use App\Entity\SERO\Status;
use App\Entity\SERO\Version;
use App\Form\SERO\ApplicationFeedbackType;
use App\Form\SERO\ApplicationType;
use App\Form\SERO\AmendmentType;
use App\Form\SERO\ContinuationType;
use App\Form\SERO\IcfType;
use App\Form\SERO\VersionType;
use App\Repository\ApplicationRepository;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Address;
use App\Repository\SERO\ApplicationFeedbackRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Validator\Constraints\DateTime;
use App\Helper\SEROHelper;
use App\Repository\SERO\ReviewerRecommendationRepository;
use Doctrine\DBAL\Types\DecimalType;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\Entity;
use Dompdf\Dompdf;
use Dompdf\Options;
use Symfony\Component\Mailer\Exception\TransportException;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mime\Email;

#[Route('{_locale<%app.supported_locales%>}/viz')]

class VizController extends AbstractController
{
    #[Route('/', name: 'app_viz_dash', methods: ['GET', 'POST'])]
    public function index(Request $request, EntityManagerInterface $em, 
     ): Response
    {
        // $this->denyAccessUnlessGranted('ROLE_ADMIN');
        $this->denyAccessUnlessGranted('ROLE_USER');
        
        $statuses =  $em->getRepository(Status::class)->findAll();
        $revrecommendations =  $em->getRepository(ReviewerRecommendation::class)->findAll();
        $decisions = $em->getRepository(DecisionType::class)->findAll();
        $actions = $em->getRepository(ActionAudit::class)->findAll();
         
        return $this->render('viz/dashboard.html.twig', [
            'actions' => $actions,
            'revrecommendations' => $revrecommendations,
            'statuses' => $statuses,
            'decisions' => $decisions
        ]);
    }

    
}
