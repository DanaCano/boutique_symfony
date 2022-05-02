<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/category')]
class CategoryController extends AbstractController
{
    #[Route('/', name: 'app_category_index', methods: ['GET'])]
    public function index(CategoryRepository $categoryRepository, ProductRepository $productRepository): Response
    {

        /**
         *      CONDITION USER-ADMIN PAS TOUCHER
         */
        if ($this->isGranted('ROLE_ADMIN')) {
            return $this->render('category/index.html.twig', [
                'categories' => $categoryRepository->findAll(),
            ]);
        } else {
            return $this->render('home/index.html.twig');
        }
    }

    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------

    #[Route('/new', name: 'app_category_new', methods: ['GET', 'POST'])]
    public function new(Request $request, CategoryRepository $categoryRepository): Response
    {

        /**
         *      CONDITION USER-ADMIN PAS TOUCHER
         */
        if ($this->isGranted('ROLE_ADMIN')) {
            $category = new Category();
            $form = $this->createForm(CategoryType::class, $category);
            $form->handleRequest($request);

            if ($form->isSubmitted() && $form->isValid()) {
                $categoryRepository->add($category);
                return $this->redirectToRoute('app_category_index', [], Response::HTTP_SEE_OTHER);
            }

            return $this->renderForm('category/new.html.twig', [
                'category' => $category,
                'form' => $form,
            ]);
        } else {
            return $this->render('error/index.html.twig');
        }
    }

    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------
    // ------------------------------------------------------------

    #[Route('/{id}', name: 'app_category_show', methods: ['GET'])]
    public function show(Category $category, CategoryRepository $categoryRepository, EntityManagerInterface $em, ProductRepository $productRepository, Request $rq): Response
    {

        $cats = $categoryRepository->findBy(['id' => $category->getId()]);
        $products = $productRepository->findBy(['categories' => $cats]);


        return $this->render('category/show.html.twig', [
            'category' => $category,
            'products' => $products,

        ]);
    }

    public function affichage(CategoryRepository $categoryRepository, EntityManagerInterface $em): Response
    {

        $categories = $categoryRepository->findBy(['parent' => 4]);
        $categories1 = $categoryRepository->findBy(['parent' => 5]);
        return $this->render('menu.html.twig', [
            'affichage' => $categories,
            'affichage1' => $categories1,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_category_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Category $category, CategoryRepository $categoryRepository): Response
    {
        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $categoryRepository->add($category);
            return $this->redirectToRoute('app_category_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('category/edit.html.twig', [
            'category' => $category,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_category_delete', methods: ['POST'])]
    public function delete(Request $request, Category $category, CategoryRepository $categoryRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $category->getId(), $request->request->get('_token'))) {
            $categoryRepository->remove($category);
        }

        return $this->redirectToRoute('app_category_index', [], Response::HTTP_SEE_OTHER);
    }
}
