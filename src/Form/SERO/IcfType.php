<?php

namespace App\Form\SERO;

use App\Entity\SERO\Application;
use App\Entity\SERO\Icf;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class IcfType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
           
        
            ->add('description')
            ->add('attachment', FileType::class, [
                'label' => 'Upload attachment',
                  'attr' => [
                    'class' => 'form-control my-4' ,
                ],
                'required' => true,
            ]) 
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Icf::class,
        ]);
    }
}
