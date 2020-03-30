<?php


namespace App\Forms;

use App\Model\CenikManager;
use App\Model\TreninkyManager;
use Nette\Application\UI\Form;

final class CenovkaFormFactory
{
    private $manager;
    private $factory;
    private $treninkyManager;

    public function __construct(FormFactory $factory, CenikManager $manager, TreninkyManager $treninkyManager)
    {
        $this->manager = $manager;
        $this->factory = $factory;
        $this->treninkyManager = $treninkyManager;
    }

    public function create(callable $onSuccess) : Form
    {
        $form = $this->factory->create();
        $skupiny = $this->treninkyManager->getSkupiny();
        $form->addInteger("cena")->setRequired()->setHtmlAttribute("placeholder", "Cena");
        $form->addText("popis")->setRequired()->setHtmlAttribute("placeholder", "Popis");
        $s = [];
        foreach ($skupiny as $skupina){
            $s[$skupina->id] = $skupina->nazev;
        }
        $form->addSelect("skupina_id", "", $s);
        $form->addSubmit("submit", "Odeslat");

        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess) : void
        {
            $this->manager->insertCena($values);
            $onSuccess();
        };

        return $form;
    }

}