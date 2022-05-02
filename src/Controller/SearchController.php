<?php

namespace App\Controller;

use App\Repository\GameRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SearchController extends AbstractController
{
    #[Route('/recherche', name: 'app_search')]
    public function index(Request $request, ProductRepository $productRepository): Response
    {
        $mot = $request->query->get("search");
        $products = $productRepository->findBySearch($mot);

        return $this->render('search/index.html.twig', [
            'products' => $products,
            'mot'=> $mot
        ]);
    }
}