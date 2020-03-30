<?php


namespace App\Presenters;

use App\Model\PisnickyManager;

final class PisnickyPresenter extends BasePresenter
{
   private $pisnickyManager;

   public function __construct(PisnickyManager $manager)
   {
       $this->pisnickyManager = $manager;
   }

   public function renderDefault(string $rytmus = "") : void
   {
       $this->template->pisnicky = $this->pisnickyManager->getPisnicky($rytmus);
   }

   public function renderShow(int $id) : void
   {
       try {
           $pisnicka = $this->pisnickyManager->getPisnicka($id);
       }catch (\TypeError $e){
           $this->flashMessage("Písnička s tímto id neexistuje!", "error");
           $this->redirect("Pisnicky:default");
       }



       if($pisnicka){
           $this->template->pisnicka = $pisnicka;
       }
   }

   public function handlePridatDoOblibenych(int $id) : void
   {
       $this->pisnickyManager->like($id);
       $this->flashMessage("Písnička přidána do oblíbených.", "success");
   }

   public function handleOdebratZOblibenych(int $id) : void
   {
       $this->pisnickyManager->dislike($id);
       $this->flashMessage("Písnička odebrána z oblíbených.", "success");
   }

}