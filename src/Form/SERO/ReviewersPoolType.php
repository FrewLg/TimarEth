<?php

namespace App\Form\SERO;

use App\Entity\SERO\ReviewersPool;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ReviewersPoolType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('email')
            ->add('user', EntityType::class,[
                'class'=>User::class,
                'placeholder' => '--Select User--',
                'attr'=>['class'=>'select2 form-control'

                ]
                
            ])
            ->add('affiliation')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => ReviewersPool::class,
        ]);
    }
}
