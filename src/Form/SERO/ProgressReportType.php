<?php

namespace App\Form\SERO;

use App\Entity\SERO\Application;
use App\Entity\SERO\ProgressReport;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProgressReportType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // ->add('submittedAt', null, [
            //     'widget' => 'single_text',
            // ])
            ->add('attachment', FileType::class, [
                'label' => 'Upload attachment',
                'mapped' => false, 'attr' => [
                    'class' => 'form-control my-4' ,
                ],
                'required' => true,
            ])
            ->add('summary')
            ->add('keyResultsOfResearch')
            ->add('challenges')
            // ->add('protocol', EntityType::class, [
            //     'class' => Application::class,
            //     'choice_label' => 'id',
            // ])
            // ->add('submittedBy', EntityType::class, [
            //     'class' => User::class,
            //     'choice_label' => 'id',
            // ])
            // ->add('approvedBy', EntityType::class, [
            //     'class' => User::class,
            //     'choice_label' => 'id',
            // ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => ProgressReport::class,
        ]);
    }
}
