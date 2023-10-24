<?php

namespace App\Controller;


use App\Entity\Questionnaire;
use App\Entity\Responses;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

class PostController extends AbstractController
{

    public function index(): Response
    {
        return $this->render('questions.html.twig', [
            'title' => 'Questions',
        ]);
    }

    #[Route("/questions", name: "questions")]

    public function afficherQuestionnaire(EntityManagerInterface $entityManager, Request $request): Response
    {
        $question = [];
        $response = [];
        $post = $entityManager->getRepository(Questionnaire::class)->findAll();
        foreach ($post as $p) {
            $question[] = $p->getQuestion();
            $response[] = $p->getResponse();
        }
        for ($i = 0; $i < count($response); $i++) {
            $response[$i] = explode(",", $response[$i]);
        }

        for ($i = 0; $i < count($question); $i++) {
            $questions[] = [$question[$i], $response[$i]];
        }

        $form = $this->createFormBuilder()
            ->add('formulaire', CollectionType::class, ['label' => $questions])
            ->getForm();

            if($request->isMethod('POST')) {
                $donnees = $request->request->get('tableau');
                $donnees = json_encode($donnees);
                $response = new Responses;
                $response->setResponse($donnees);
                $entityManager->persist($response);
                $entityManager->flush(); 
            }
        
        
                
        return $this->render('questions.html.twig', [
            'form' => $form->createView()
        ]);
    }

    public function questionnaire()
    {
        return $this->render('questionnaire.html.twig', [
            'title' => 'Questionnaire',
        ]);
    }

    public function renderQuestionnaire($doctrine)
    {
        $data = $_POST['tableau'];
        $response = new Responses;
        $response->setResponse($data);
        $response = mb_convert_encoding($response, 'UTF-8', 'UTF-8');

        $entityManager = $doctrine;
        $entityManager->persist($response);
        $entityManager->flush(); 
    }

        
}