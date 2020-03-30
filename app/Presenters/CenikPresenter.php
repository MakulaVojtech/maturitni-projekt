<?php


namespace App\Presenters;

use App\Model\CenikManager;

final class CenikPresenter extends BasePresenter
{
    private $cenikManager;

    public function __construct(CenikManager $manager)
    {
        $this->cenikManager = $manager;
    }

    public function renderDefault() : void
    {
        $this->template->skupiny = $this->cenikManager->getCenik();
    }
}