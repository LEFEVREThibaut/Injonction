<?php

namespace Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ClasseTest
{
    #[Route('/')]
    

    public function homepage(): Response
    {
        return new Response('Hello World');
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