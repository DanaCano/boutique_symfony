<?php

namespace App\Controller;

use App\Entity\Transporter;
use App\Form\TransporterType;
use App\Repository\TransporterRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/transporter')]
class TransporterController extends AbstractController
{
    #[Route('/', name: 'app_transporter_index', methods: ['GET'])]
    public function index(TransporterRepository $transporterRepository): Response
    {
        return $this->render('transporter/index.html.twig', [
            'transporters' => $transporterRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_transporter_new', methods: ['GET', 'POST'])]
    public function new(Request $request, TransporterRepository $transporterRepository): Response
    {
        $transporter = new Transporter();
        $form = $this->createForm(TransporterType::class, $transporter);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $transporterRepository->add($transporter);
            return $this->redirectToRoute('app_transporter_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('transporter/new.html.twig', [
            'transporter' => $transporter,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_transporter_show', methods: ['GET'])]
    public function show(Transporter $transporter): Response
    {
        return $this->render('transporter/show.html.twig', [
            'transporter' => $transporter,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_transporter_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Transporter $transporter, TransporterRepository $transporterRepository): Response
    {
        $form = $this->createForm(TransporterType::class, $transporter);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $transporterRepository->add($transporter);
            return $this->redirectToRoute('app_transporter_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('transporter/edit.html.twig', [
            'transporter' => $transporter,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_transporter_delete', methods: ['POST'])]
    public function delete(Request $request, Transporter $transporter, TransporterRepository $transporterRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$transporter->getId(), $request->request->get('_token'))) {
            $transporterRepository->remove($transporter);
        }

        return $this->redirectToRoute('app_transporter_index', [], Response::HTTP_SEE_OTHER);
    }
}
