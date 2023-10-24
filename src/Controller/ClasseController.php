<?php

namespace App\Controller;


use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ClasseController extends AbstractController

{
   
    #[Route('/ ', name: 'home')]
    
   

    public function index(): Response
    {
        return $this->render('presentation.html.twig', [
            'title' => 'Homepage',
        ]); 
    }

    #[Route('/browse/{slug}')]
    public function browse(string $slug = null): Response
    {
        if($slug) {
            $title = 'Browse : '. ucwords(str_replace('-', ' ', $slug));
        } else {
            $title = 'All';
        }
        return new Response($title);
    }
}




?>