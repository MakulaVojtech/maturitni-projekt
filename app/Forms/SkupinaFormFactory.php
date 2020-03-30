<?php


namespace App\Forms;

use App\Model\TreninkyManager;
use Nette\Application\UI\Form;

final class SkupinaFormFactory
{

    private $manager;
    private $factory;

    public function __construct(TreninkyManager $manager, FormFactory $factory)
    {
        $this->manager = $manager;
        $this->factory = $factory;
    }

    public function create(callable $onSuccess) : Form
    {
        $form = $this->factory->create();
        $form->addText("nazev")
            ->setHtmlAttribute("placeholder", "Název skupiny")
            ->setRequired("Zadej název skupiny");

        $form->addText("popis")
            ->setHtmlAttribute("placeholder", "Popis skupiny")
            ->setRequired("Zadej popis skupiny");
        $form->addSubmit("submit", "Přidat");
        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess) : void
        {
            $this->manager->insertSkupina($values);
            $onSuccess();
        };
        return $form;
    }

}