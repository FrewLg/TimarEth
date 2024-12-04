<?php

namespace App\Form;

use App\Entity\Downloadables;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class DownloadablesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('attachment', FileType::class, [
                'label' => 'Upload attachment',
                'mapped' => false, 'attr' => [
                    'class' => 'form-control my-4' ,
                ],
                'required' => true,
            ])
            ->add('description')
            // ->add('createdAt', null, [
            //     'widget' => 'single_text',
            // ])
            // ->add('uploadedBy', EntityType::class, [
            //     'class' => User::class,
            //     'choice_label' => 'id',
            // ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Downloadables::class,
        ]);
    }
}
