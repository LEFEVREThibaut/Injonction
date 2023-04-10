<?php

namespace App\Controller;

use App\Form\TaskType;
use App\Entity\Task;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Validator\Constraint as Assert;

class ClasseController extends AbstractController

{
   
    #[Route('/', name: 'home')]
    
   

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
   /* #[Route('/', name: 'home')]
    public function createTask(): Response {
        $task = new Task();
        $task->setTask('Ma tâche pré-définie');
        $form = $this->createForm(TaskType::class, $task);
        return $this->render('presentation.html.twig', ['variable' => $form->createView()]);
    }*/

    

}




?>