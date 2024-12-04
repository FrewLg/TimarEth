<?php

namespace App\Form\SERO;

use App\Entity\SERO\Application;
use App\Entity\SERO\AttachmentType;
use App\Entity\SERO\FinancialDisclosure;
use App\Entity\SERO\InvestigationalNewDrug;
use App\Entity\SERO\IonizingRadiationUse;
use App\Entity\SERO\MultiSiteCollaboration;
use App\Entity\SERO\ParticipantCharacter;
use App\Entity\SERO\ProceedureUse;
use App\Entity\SERO\SpecialResRequirement;
use App\Entity\SERO\StudyPopulation;
use App\Entity\SERO\StudyType;
use PHPUnit\Framework\Test;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

 

class ApplicationInitialType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'Protocol title'

                ]
            ])
            
            ->add('description', TextareaType::class, [
                'label' => 'Summary' ,
                'attr' => [
                    'class' => 'form-control ck-rounded-corners',
                    'placeholder' => 'Summary'

                ]
            ])

            ->add('startDate', null, [
                'widget' => 'single_text',
            ])
            ->add('endDate', null, [
                'widget' => 'single_text',
            ])
           
            ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Application::class,
        ]);
    }
}
