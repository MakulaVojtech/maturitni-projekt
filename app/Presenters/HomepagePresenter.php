<?php

declare(strict_types=1);

namespace App\Presenters;
use App\Model;


final class HomepagePresenter extends BasePresenter
{
    private $novinkyManager;
    private $treninkyManager;

    public function __construct(Model\NovinkyManager $novinkyManager, Model\TreninkyManager $treninkyManager)
    {
        $this->novinkyManager = $novinkyManager;
        $this->treninkyManager = $treninkyManager;
    }

    public function renderDefault(): void
	{
		$this->template->novinky = $this->novinkyManager->getNovinky(3);
		$this->template->info = $this->novinkyManager->getInfo();
		$this->template->treninky = $this->treninkyManager->getTreninky();
	}

    public function actionLogOut(): void
    {
        $this->getUser()->logout();
        $this->flashMessage("Odhlášení proběhlo úspěšně", "success");
        $this->redirect("Homepage:default");
    }
}
