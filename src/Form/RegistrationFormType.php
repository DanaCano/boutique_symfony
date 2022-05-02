<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\Regex;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'mapped' => false,
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/',
                        'message' => 'Votre email n\'est pas valide.'
                    ])
                ]
            ])

            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir un mot de passe',
                    ]),
                    new Length([
                        'min' => 8,
                        'minMessage' => 'Votre mot de passe doit comporter au moins 8 caractères',
                        // max length allowed by Symfony for security reasons
                        'max' => 50,
                    ]),


                ],
            ])

            ->add('lastname', TextType::class, [
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir un nom',
                    ]),
                    new Length([
                        // max length allowed by Symfony for security reasons
                        'max' => 100,
                        'maxMessage' => "Votre nom doit comporter moins de 100 caractères"
                    ]),
                ],
                'label' => 'Nom'
            ])

            ->add('firstname', TextType::class, [
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir un prénom',
                    ]),
                    new Length([
                        // max length allowed by Symfony for security reasons
                        'max' => 100,
                        'maxMessage' => 'Votre prénom doit comporter moins de 100 caractères'
                    ])
                ],
                'label' => 'Prénom'
            ])

            ->add('address', TextType::class, [
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir une adresse',
                    ]),
                    new Length([
                        'min' => 5,
                        'minMessage' => 'Votre adresse doit comporter au moins 5 caractères',
                        // max length allowed by Symfony for security reasons
                        'max' => 100,
                    ]),
                ],
                'label' => 'Adresse'
            ])

            ->add('zipcode', TextType::class, [

                'mapped' => false,
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]{5}$/',
                        'message' => 'Veuillez saisir uniquement des chiffres',
                    ]),
                    new NotBlank([
                        'message' => 'Veuillez saisir un code postal',
                    ]),
                ],

            ])

            ->add('city', TextType::class, [
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir la ville',
                    ]),

                ],
                'label' => 'Ville'
            ])

            ->add('agreeTerms', CheckboxType::class, [
                'mapped' => false,
                'constraints' => [
                    new IsTrue([
                        'message' => 'Vous devez accepter nos conditions CGU.',
                    ]),
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
