<?php

namespace App\Controller;


use App\Entity\Post;
use App\Entity\Questionnaire;
use App\Entity\Responses;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\ResponseEntity;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Test\FormInterface;
use Symfony\Component\Serializer\Encoder\JsonEncode;

class PostController extends AbstractController
{
    #[Route("/post", name: "post")]

    public function index(): Response
    {
        return $this->render('questions.html.twig', [
            'title' => 'Questions',
        ]);
    }
    #[Route("/post", name: "post")]

    public function bonjour(EntityManagerInterface $entityManager)
    {
        $post = $entityManager->find(Post::class, 1);
        //$post = new Post(); // initialise l'entité
        $post->setTitre('Mon '); // on set les différents champs
        $post->setMessage('Allez hop un petit message');
        $post->setDatePublication(new \Datetime);
        $entityManager->persist($post); // on déclare une modification de type persist et la gén
        $entityManager->flush(); // on effectue les différentes modifications sur la base de donné
        // réelle
        return new Response('Sauvegarde OK sur : ' . $post->getId());
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
        
        $entityManager = $doctrine;
        $entityManager->persist($response);
        $entityManager->flush(); 
    }

        
}

