<?php

namespace App\Controller;

use App\Entity\Responses;
use App\Entity\Questionnaire;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class ResponseController extends AbstractController
{
    #[Route('/response', name: 'response')]
    public function responseFunction(EntityManagerInterface $entityManager): Responses
    {
        $responses = [];
        $reponse = $entityManager->getRepository(Responses::class)->findAll();
        foreach ($reponse as $r) {
            $responses[] = $r->getResponse();
        }
        for ($i = 0; $i < count($responses); $i++) {
            $responses[$i] = explode(",", $responses[$i]);
        }
        var_dump($responses);
        return $this->render('response.html.twig', [
            'responses' => $responses,
        ]);
    }
}


?>