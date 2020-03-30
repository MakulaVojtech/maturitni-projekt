<?php


namespace App\Presenters;

use App\Model\NovinkyManager;


final class NovinkyPresenter extends BasePresenter
{
    private $novinkyManager;

    public function __construct(NovinkyManager $novinkyManager)
    {
        $this->novinkyManager = $novinkyManager;
    }

    public function renderDefault() : void
    {
        $this->template->novinky = $this->novinkyManager->getNovinky();
    }

    public function renderShow($id) : void
    {
        $novinkaArray = $this->novinkyManager->getNovinka($id);
        if(empty($novinkaArray)){
            $this->flashMessage("Novinka s tímto id neexistuje!", "error");
            $this->redirect("Novinky:default");
        }else{
            $this->template->novinka = $novinkaArray["novinka"];
            $this->template->uzivatel = $novinkaArray["uzivatel"];
            $this->template->obrazky = $novinkaArray["obrazky"];
        }
    }

}