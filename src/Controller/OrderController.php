<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\User;
use App\Form\OrderType;
//use DateTime as GlobalDateTime;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderController extends AbstractController
{
    #[Route('/commande', name: 'order')]
    public function index(SessionInterface $session, Request $request): Response
    {
        $form = $this->createForm(OrderType::class, null, [
            'user' =>$this->getUser()
        ]);

  
        return $this->render('order/index.html.twig',[
            'form'=> $form->createView(),
            'cart'=> $session->get('dataPanier', []),
        ]);
        
    }

    #[Route('/commande/recapitulatif', name: 'order_recap')]
    public function add(SessionInterface $session, Request $request, User $user): Response
    {
        $form = $this->createForm(OrderType::class, null, [
            'user' =>$this->getUser()
        ]);

        
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            //$date=new DateTime();
            $transporters=$form->get('transporters')->getData();
            $delivery=$user->getFirstname();
            dump($delivery);


            //Enregistrer ma commande (Order)
            $order= new Order();
            $order->setUser($this->getUser());
           // $order->setCreatedAt($date);
            $order->setTransporterName($transporters->getName());
            $order->setTransporterPrice($transporters->getPrice());


            //Enregistrer mes produits (Order detail)


        }  
        return $this->render('order/add.html.twig',[
            'cart'=> $session->get('dataPanier', []),
        ]);
        
    }
}
