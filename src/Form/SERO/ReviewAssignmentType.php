<?php

namespace App\Form\SERO;

use App\Entity\SERO\Application;
use App\Entity\SERO\BoardMember;
use App\Entity\SERO\ReviewAssignment;
use App\Entity\SERO\ReviewersPool;
use App\Entity\SERO\ReviewForm;
use App\Entity\User;
use Symfony\Component\Translation\TranslatableMessage;
use Doctrine\Common\Collections\ArrayCollection;
use App\Repository\SERO\ReviewAssignmentRepository;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Bridge\Doctrine\Form\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use DateTime;
use Symfony\Component\Validator\Constraints\NotBlank;

class ReviewAssignmentType extends AbstractType
{
    private $reviewAssignmentRepository;
    public function __construct(ReviewAssignmentRepository $reviewAssignmentRepository)
    {
        $this->reviewAssignmentRepository = $reviewAssignmentRepository;
    }


    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $reviewAssignment = $options['data'];
        if (!$reviewAssignment instanceof ReviewAssignment) {
            return;
        }
        
        $already_assigned = (new ArrayCollection($this->reviewAssignmentRepository->findBy(['application' => $options['application']])))->map(function ($element) {
            return $element->getIrbreviewer();
        });

        $builder

            ->add('reviewForm', EntityType::class, [
                'class' => ReviewForm::class,
                'choice_label' => 'name',
                'help' => new TranslatableMessage('reviewForm', ['%order_id%' => $reviewAssignment->getId()], 'store'),
                'attr' => ['class' => 'form-control form-control-lg form-control-solid  select2 mb-4 p-4'],
            ])

            ->add(
                'irbreviewer',
                EntityType::class,
                [
                    "required" => true,
                    'class' => User::class,
                    'query_builder' => function (EntityRepository $er) use ($already_assigned) {

                        $qb = $er->createQueryBuilder('u')
                            ->andWhere("u.roles like '%ROLE_BOARD_MEMBER%'");
                        if (sizeof($already_assigned->getValues()) > 0) {
                            $qb->andWhere("u not in  (:irbreviewer)")
                                ->setParameter('irbreviewer', $already_assigned->getValues());
                        }

                        return $qb->orderBy('u.email', 'ASC');
                    },
                    'help' => new TranslatableMessage('irbreviewer', ['%id%' => $reviewAssignment->getId()], 'name'),

                    'label' => 'Primary Reveiwer',
                    'placeholder' => '--Select a reveiwer from board members--',
                    "attr" => [
                        "class" => "select2 form-control form-control-lg form-control-solid",
                    ],
                    'choice_label' => function (User $user) {
                        return $user . "--" . "("  . count($user->getReviewAssignments()) .  ")";
                    },

                ]
            )

            ->add('invitationResponseDueDate', DateType::class, array(
                'placeholder' => [
                    'year' => 'Year',
                    'month' => 'Month',
                    'day' => 'Day',
                ],

              
                'label' => 'Invitation response due date (default date 4 days now)',
                'widget' => 'single_text',
                'format' => 'yyyy-MM-dd',
                'data' => (new DateTime('+4 day')),
                'attr' => array(
                    'min' => (new DateTime())->format('Y-m-d'),
                    'max' => (new DateTime('+30 day'))->format('Y-m-d'),
                    'required' => true,
                    'class' => 'form-control',
                ),
            ))

            ->add('duedate', DateType::class, array(
                'placeholder' => [
                    'year' => 'Year',
                    'month' => 'Month',
                    'day' => 'Day',
                ],
                'label' => 'Review due date (default date 10 days now)',
                'widget' => 'single_text',
                'format' => 'yyyy-MM-dd',
                'data' => (new DateTime('+10 day')),
                'attr' => array(
                    'min' => (new DateTime())->format('Y-m-d'),
                    'max' => (new DateTime('+30 day'))->format('Y-m-d'),
                    'required' => true,
                    'class' => 'form-control',
                ),
            ))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'application' => null,
            'data_class' => ReviewAssignment::class,
        ]);
    }
}


class SecondaryReviewerAssignmentType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $reviewAssignment = $options['data'];
        if (!$reviewAssignment instanceof ReviewAssignment) {
            return;
        }
        $builder
            ->add('reviewForm', EntityType::class, [
                'class' => ReviewForm::class,
                'choice_label' => 'name',
                'help' => new TranslatableMessage('reviewForm', ['%order_id%' => $reviewAssignment->getId()], 'store'),
                'attr' => ['class' => 'form-control form-control-lg form-control-solid  select2 mb-4 p-4'],
            ])
            ->add(
                'secReviewer',
                EntityType::class,
                [
                    'label' => 'Secondary Reveiwer',
                    'placeholder' => "--Select from reviewers' poll--",
                    "attr" => [
                        "class" => "select2 form-control form-control-lg form-control-solid",
                    ],
                    'class' => ReviewersPool::class,
                    'choice_label' => 'name',
                    'help' => new TranslatableMessage('secReviewer', ['%order_id%' => $reviewAssignment->getId()], 'store'),
                    'attr' => ['class' => 'form-control form-control-lg form-control-solid  select2 mb-4 p-4'],

                ]
            )

            ->add('invitationResponseDueDate', DateType::class, array(
                'placeholder' => [
                    'year' => 'Year',
                    'month' => 'Month',
                    'day' => 'Day',
                ],
                'label' => 'Invitation response due date (default date 4 days now)',
                'widget' => 'single_text',
                'format' => 'yyyy-MM-dd',
                'data' => (new DateTime('+4 day')),
                'attr' => array(
                    'min' => (new DateTime())->format('Y-m-d'),
                    'max' => (new DateTime('+30 day'))->format('Y-m-d'),
                    'required' => true,
                    'class' => 'form-control',
                ),
            ))
            ->add('duedate', DateType::class, array(
                'placeholder' => [
                    'year' => 'Year',
                    'month' => 'Month',
                    'day' => 'Day',
                ],
                'label' => 'Review due date (default date 10 days now)',
                'widget' => 'single_text',
                'format' => 'yyyy-MM-dd',
                'data' => (new DateTime('+10 day')),
                'attr' => array(
                    'min' => (new DateTime())->format('Y-m-d'),
                    'max' => (new DateTime('+30 day'))->format('Y-m-d'),
                    'required' => true,
                    'class' => 'form-control',
                ),
            ));
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'application' => null,
            'data_class' => ReviewAssignment::class,
        ]);
    }
}
