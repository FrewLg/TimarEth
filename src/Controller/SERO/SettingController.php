<?php

namespace App\Controller\SERO;

use App\Entity\SERO\FinancialDisclosure;
use App\Entity\SERO\MultiSiteCollaboration;
use App\Entity\SERO\ProceedureUse;
use App\Entity\SERO\SpecialResRequirement;
use App\Entity\SERO\StudyPopulation;
use App\Entity\SERO\StudyType;
use App\Form\SERO\MultiSiteCollaborationType;
use App\Form\SERO\ProceedureUseType;
use App\Form\SERO\SpecialResRequirementType;
use App\Form\SERO\StudyPopulationType;
use App\Form\SERO\StudyTypeType;
use App\Repository\SERO\AttachmentTypeRepository;
use App\Repository\SERO\DecisionTypeRepository;
use App\Repository\SERO\FinancialDisclosureRepository;
use App\Repository\SERO\InvestigationalNewDrugRepository;
use App\Repository\SERO\IonizingRadiationUseRepository;
use App\Repository\SERO\MultiSiteCollaborationRepository;
use App\Repository\SERO\ParticipantCharacterRepository;
use App\Repository\SERO\ProceedureUseRepository;
use App\Repository\SERO\SpecialResRequirementRepository;
use App\Repository\SERO\StudyPopulationRepository;
use App\Repository\SERO\StudyTypeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('{_locale<%app.supported_locales%>}/allsettings')]
class SettingController extends AbstractController
{


    #[Route('/', name: 'app_workflow_settings', methods: ['GET', 'POST'])]
    public function new(
        Request $request,
        EntityManagerInterface $entityManager,
        SpecialResRequirementRepository $sprrrep,
        StudyTypeRepository $strep,
        MultiSiteCollaborationRepository $msr,
        ProceedureUseRepository $purep,
        StudyPopulationRepository $stpoprep,
        ParticipantCharacterRepository $partcharep,
        IonizingRadiationUseRepository $iionrep,
        InvestigationalNewDrugRepository $innewdrrep,
        FinancialDisclosureRepository $findisrepo,
        DecisionTypeRepository $dectyrepo,
        AttachmentTypeRepository $attyrepo,

    ): Response {

        $multiSiteCollaboration = new MultiSiteCollaboration();
        $multiSiteCollaboration_form = $this->createForm(MultiSiteCollaborationType::class, $multiSiteCollaboration);
        $multiSiteCollaboration_form->handleRequest($request);

        if ($multiSiteCollaboration_form->isSubmitted() && $multiSiteCollaboration_form->isValid()) {
            $entityManager->persist($multiSiteCollaboration);
            $entityManager->flush();

            return $this->redirectToRoute('app_settings', [], Response::HTTP_SEE_OTHER);
        }

        $proceedureUse = new ProceedureUse();
        $proceedure_use_form = $this->createForm(ProceedureUseType::class, $proceedureUse);
        $proceedure_use_form->handleRequest($request);

        if ($proceedure_use_form->isSubmitted() && $proceedure_use_form->isValid()) {
            $entityManager->persist($proceedureUse);
            $entityManager->flush();

            return $this->redirectToRoute('app_settings', [], Response::HTTP_SEE_OTHER);
        }

        $specialResRequirement = new SpecialResRequirement();
        $specialResRequirement_form = $this->createForm(SpecialResRequirementType::class, $specialResRequirement);
        $specialResRequirement_form->handleRequest($request);

        if ($specialResRequirement_form->isSubmitted() && $specialResRequirement_form->isValid()) {
            $entityManager->persist($specialResRequirement);
            $entityManager->flush();

            return $this->redirectToRoute('app_settings', [], Response::HTTP_SEE_OTHER);
        }

        $studyType = new StudyType();
        $studyType_form = $this->createForm(StudyTypeType::class, $studyType);
        $studyType_form->handleRequest($request);

        if ($studyType_form->isSubmitted() && $studyType_form->isValid()) {
            $entityManager->persist($studyType);
            $entityManager->flush();

            return $this->redirectToRoute('study_type_index', [], Response::HTTP_SEE_OTHER);
        }

        $studyPopulation = new StudyPopulation();
        $studyPopulationform = $this->createForm(StudyPopulationType::class, $studyPopulation);
        $studyPopulationform->handleRequest($request);

        if ($studyPopulationform->isSubmitted() && $studyPopulationform->isValid()) {
            $entityManager->persist($studyPopulation);
            $entityManager->flush();

            return $this->redirectToRoute('app_s_e_r_o_study_population_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sero/settings/index.html.twig', [
            'multi_site_collaboration' => $multiSiteCollaboration,
            'multi_site_collaboration' => $multiSiteCollaboration,
            'studyPopulationform' => $studyPopulationform,
            'studyPopulation' => $stpoprep->findAll(),
            'studyType_form' => $studyType_form,
            'specialResRequirement_form' => $specialResRequirement_form,
            'special_res_requirements' => $sprrrep->findAll(),
            'study_types' => $strep->findAll(),

            'proceedure_use' => $purep->findAll(),
            'proceedure_use_form' => $proceedure_use_form,
            'multi_site_collaboration' => $msr->findAll(),
            'multiSiteCollaboration_form' => $multiSiteCollaboration_form,
        ]);
    }
}
