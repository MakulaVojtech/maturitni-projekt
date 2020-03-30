<?php


namespace App\Presenters;

use App\Model\TreneriManager;

class TreneriPresenter extends BasePresenter
{
    private $treneriManager;

    public function __construct(TreneriManager $manager)
    {
        $this->treneriManager = $manager;
    }

    public function renderDefault() : void
    {
        $this->template->treneri = $this->treneriManager->getTreneri();
    }

    public function renderTrener($id) : void
    {
        $trener = $this->treneriManager->getTrener($id);
        if(empty($trener)){
            $this->flashMessage("Trenér s tímto id neexistuje!", "error");
            $this->redirect("Treneri:default");
        }else{
            $this->template->trener = $trener["trener"];
            $this->template->obrazek = $trener["obrazek"];
        }
    }
}