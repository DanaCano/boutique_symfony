<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductType;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{

    #[Route('/product', name: 'app_product_index', methods: ['GET'])]
    public function index(ProductRepository $productRepository): Response
    {

        /**
         *      CONDITION USER-ADMIN PAS TOUCHER
         */
        if ($this->isGranted('ROLE_ADMIN')) {
            return $this->render('product/index.html.twig', [
                'products' => $productRepository->findAll(),
            ]);
        } else {

            return $this->render('error/index.html.twig', [
                'users' => $productRepository->findAll(),
            ]);
        }
    }

    #[Route('/product/new', name: 'app_product_new', methods: ['GET', 'POST'])]

    public function new(Request $request, ProductRepository $productRepository, EntityManagerInterface $em): Response
    {

        /**
         *      CONDITION USER-ADMIN PAS TOUCHER
         */
        if ($this->isGranted('ROLE_ADMIN')) {
            $product = new Product();
            $form = $this->createForm(ProductType::class, $product);
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {
                // $productRepository->add($product);

                if ($fichier = $form->get('image')->getData()) {
                    $nomFichier = pathinfo($fichier->getClientOriginalName(), PATHINFO_FILENAME);
                    $nomFichier = str_replace(' ', '_', $nomFichier);
                    $nomFichier .= "_" . uniqid() . '_' . $fichier->guessExtension();
                    $fichier->move("image", $nomFichier);
                    $product->setImage($nomFichier);
                }
                $em->persist($product);
                $em->flush();
                return $this->redirectToRoute('app_product_index', [], Response::HTTP_SEE_OTHER);
            }


            return $this->renderForm('product/new.html.twig', [
                'product' => $product,
                'form' => $form,
            ]);
        } else {
            return $this->render('error/index.html.twig', [
                'users' => $productRepository->findAll(),
            ]);
        }
    }

    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------


    #[Route('/product/{id}', name: 'app_product_show', methods: ['GET'])]

    public function show(Product $product, ProductRepository $productRepository): Response
    {


        /**
         *      CONDITION USER-ADMIN PAS TOUCHER
         */
        if ($this->isGranted('ROLE_ADMIN')) {
            return $this->render('product/show.html.twig', [
                'product' => $product,
            ]);
        } else {

            return $this->render('error/index.html.twig', [
                'users' => $productRepository->findAll(),
            ]);
        }
    }

    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------



    #[Route('/product/{id}/edit', name: 'app_product_edit', methods: ['GET', 'POST'])]

    public function edit(Request $request, Product $product, ProductRepository $productRepository, EntityManagerInterface $em): Response
    {

        /**
         *      CONDITION USER-ADMIN PAS TOUCHER
         */
        if ($this->isGranted('ROLE_ADMIN')) {
            $form = $this->createForm(ProductType::class, $product);
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {
                // $productRepository->add($product);

                if ($fichier = $form->get('image')->getData()) {
                    $nomFichier = pathinfo($fichier->getClientOriginalName(), PATHINFO_FILENAME);
                    $nomFichier = str_replace(' ', '_', $nomFichier);
                    $nomFichier .= "_" . uniqid() . '_' . $fichier->guessExtension();
                    $fichier->move("image", $nomFichier);
                    $product->setImage($nomFichier);
                }
                $em->persist($product);
                $em->flush();
                return $this->redirectToRoute('app_product_index', [], Response::HTTP_SEE_OTHER);
            }

            return $this->renderForm('product/edit.html.twig', [
                'product' => $product,
                'form' => $form,
            ]);

        } else {
            return $this->render('error/index.html.twig', [
                'users' => $productRepository->findAll(),
            ]);
        }

    }

    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------

    #[Route('/product/{id}', name: 'app_product_delete', methods: ['POST'])]
    public function delete(Request $request, Product $product, ProductRepository $productRepository): Response
    {

        /**
         *      CONDITION USER-ADMIN PAS TOUCHER
         */
        if ($this->isGranted('ROLE_ADMIN')) {
            if ($this->isCsrfTokenValid('delete' . $product->getId(), $request->request->get('_token'))) {
                $productRepository->remove($product);
            }

            return $this->redirectToRoute('app_product_index', [], Response::HTTP_SEE_OTHER);

        } else {
            return $this->render('error/index.html.twig', [
                'users' => $productRepository->findAll(),
            ]);
        }

    }



    #[Route('/produit', name: 'app_produit_index', methods: ['GET'])]
    public function index2(ProductRepository $productRepository): Response
    {
        return $this->render('product/indexclients.html.twig', [
            'products' => $productRepository->findAll(),
        ]);
    }

    #[Route('/produit/{id}', name: 'app_produit_show', methods: ['GET'])]
    public function show2(Product $product): Response
    {
        return $this->render('product/showclients.html.twig', [
            'product' => $product,
        ]);
    }
}
