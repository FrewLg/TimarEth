<?php

namespace App\Form;

use App\Entity\User;
use Doctrine\DBAL\Types\TextType;
use PharIo\Manifest\Email;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email'
            ,  EmailType::class,[
                'label'=>false,
                'attr'=>['placeholder'=>'Email ',
                'label'=>false,

                       'class' => 'form-control h-auto form-control-solid py-4 px-8 ',
                'required' => false, 
                  ],])

            
            ->add('plainPassword', PasswordType::class, [
                           
                'mapped' => false,
                'label'=>false,

                'attr' => ['autocomplete' => 'new-password',
                'placeholder'=>'Password ',
                'class' => 'form-control   h-auto form-control-solid py-4 px-8 ',
            
            ], 
                
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter a password',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Your password should be at least {{ limit }} characters',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
