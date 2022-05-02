<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{

    private $entityManager;
    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        $products = $this->entityManager->getRepository(Product::class)->findByisTop(1);
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'products'=> $products
        ]);
    }

    #[Route('/cgu', name: 'app_cgu')]
    public function cgu(): Response
    {
        return $this->render('home/cguFooter.html.twig');
    }

    #[Route('/cgv', name: 'app_cgv')]
    public function cgv(): Response
    {
        return $this->render('home/cgvFooter.html.twig');
    }

    #[Route('/cookies', name: 'app_cookies')]
    public function cookies(): Response
    {
        return $this->render('home/cookie.html.twig');
    }

    #[Route('/mentionsetdonnees', name: 'app_mletdn1')]
    public function mletdn1(): Response
    {
        return $this->render('home/MLetDN1.html.twig');
    }

    
    #[Route('/protectiondonnees', name: 'app_mletdn2')]
    public function mletdn2(): Response
    {
        return $this->render('home/MLetDN2.html.twig');
    }







}
