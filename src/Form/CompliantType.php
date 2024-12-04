<?php

namespace App\Form;

use App\Entity\Compliant;
use App\Entity\User;
use PharIo\Manifest\Email;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CompliantType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('email', EmailType::class)
            ->add('message')
            // ->add('createdAt', null, [
            //     'widget' => 'single_text',
            // ])
            // ->add('solved')
            // ->add('repliedBy', EntityType::class, [
            //     'class' => User::class,
            //     'choice_label' => 'id',
            // ])
            // ->add('repliedTo', EntityType::class, [
            //     'class' => Compliant::class,
            //     'choice_label' => 'id',
            // ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Compliant::class,
        ]);
    }
}
