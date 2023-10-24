<?php

namespace App\Controller;

use App\Entity\Responses;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;


class ResponseController extends AbstractController
{
    #[Route('/api', name: 'api', methods: ['GET'])]
    public function responseFunction(EntityManagerInterface $entityManager)
    {
        if (isset($_GET) && !empty($_GET)) {
            $r = [];
            $responses = [];
            $reponse = $entityManager->getRepository(Responses::class)->findAll();
            foreach ($reponse as $r) {
                $responses[] = $r->getResponse();
            }
            for ($i = 0; $i < count($responses); $i++) {
                $responses[$i] = explode(",", $responses[$i]);
                for ($j = 0; $j < count($responses[$i]); $j++) {
                    if($j == 0) {
                        $responses[$i][$j] = substr($responses[$i][$j], 4, -2);
                    }
                    else if ($j == 16){
                        $responses[$i][$j] = substr($responses[$i][$j], 2, -4);
                    }
                    else {
                        $responses[$i][$j] = substr($responses[$i][$j], 2, -2);;
                    }
                }
            }
            $save = [];
            foreach ($responses as $index => $r) {
                foreach ($r as $i => $re) {
                    $save[$i][$index] = $re;
                }
            }
            foreach ($save as $i=>$s) {
                $r[$i] = ["question".$i+1 => $s];
            }
            $renvoie = [];
            foreach (array_keys($_GET) as $key) {
                $renvoie[] = $r[$key];
            }
            $response = new JsonResponse($renvoie, 200, [], false);
            return $response;
        }
        else {
            return $this->render('resultats.html.twig', [
                'title' => 'API',
            ]);
        }
    }

    #[Route('/response', name: 'response')]
    public function graphique() {
        return $this->render('graphique.html.twig', [
            'title' => 'Graphique',
        ]);
    }
}




?>