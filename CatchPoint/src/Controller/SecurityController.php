<?php

namespace App\Controller;

use App\Entity\Users;
use App\Form\RegistrationType;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class SecurityController extends Controller
{
    /**
     * @Route("/inscription",name="security_registration")
     */
    public function registration(Request $request, ObjectManager $manager){

        $user = new Users();
        $form = $this->createForm(RegistrationType::class,$user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $manager->persist($user);
            $manager->flush();
            return $this->render('security/login.html.twig',[
                'form' => $form->createView()]);
        }

        return $this->render('security/registration.html.twig',[
            'form' => $form->createView()
        ]);
    }
    /**
     * @Route("/login",name="security_login")
     */
    public function login(){
        return $this->render('security/login.html.twig');
    }




}
