<?php


namespace App\Presenters;

use App\Model\FotoManager;


final class FotogaleriePresenter extends BasePresenter
{
    private $fotoManager;

    public function __construct(FotoManager $manager)
    {
        $this->fotoManager = $manager;
    }

    public function renderDefault() : void
    {
        $this->template->alba = $this->fotoManager->getAlba();
    }

    public function renderShow(int $id) : void
    {
        $array = $this->fotoManager->getAlbum($id);
        if(empty($array)){
            $this->flashMessage("Album s tímto id neexistuje!", "error");
            $this->redirect("Fotogalerie:default");
        }else{
            $this->template->album = $array["album"];
            $this->template->obrazky = $array["obrazky"];
        }
    }

}