<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Routing\Annotation\Route;

class ParcoursController extends Controller
{
    /**
     * @Route("/parcours", name="parcours")
     */
    public function index()
    {
        return $this->render('parcours/index.html.twig', [
            'controller_name' => 'ParcoursController',
        ]);
    }
}
