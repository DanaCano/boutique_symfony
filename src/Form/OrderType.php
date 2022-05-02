<?php

namespace App\Form;

use App\Entity\Transporter;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $user = $options['user'];

        $builder
            ->add('street', TextType::class,[
                'label' => 'Votre adresse'
            ])


            ->add('zip', TextType::class,[
                'label' => 'Votre code postal'
            ])
            ->add('city', TextType::class,[
                'label' => 'Votre ville'
            ])
            
            ->add('transporters', EntityType::class,[
                'label'=>'Choisissez votre transporteur',
                'required' =>true,
                'class'=>Transporter::class,
                'multiple'=>false,
                'expanded'=>true
            ])
            // ->add('submit', SubmitType::class, [
            //     'label'=> 'Valider ma commande',
            //     'attr' => [
            //         'class'=> 'btn btn-success btn-block'
            //         ]
            // ])
    ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'user' => array()
            
        ]);
    }
}
