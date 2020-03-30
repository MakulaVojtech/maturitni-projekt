<?php


namespace App\Presenters;

use App\Model\NovinkyManager;

final class AkcePresenter extends BasePresenter
{
    private $novinkyManager;

    public function __construct(NovinkyManager $manager)
    {
        $this->novinkyManager = $manager;
    }

    public function renderDefault() : void
    {
        $this->template->akce = $this->novinkyManager->getAkce();
    }

}