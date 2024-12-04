<?php

namespace App\Form\SERO;

use App\Entity\SERO\ReviewerRecommendation;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReviewerRecommendationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('code')
            ->add('color')
            ->add('hexcode')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => ReviewerRecommendation::class,
        ]);
    }
}
