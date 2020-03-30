<?php


namespace App\Forms;

use App\Model\NovinkyManager;
use Nette\Application\UI\Form;

final class AkceFormFactory
{
    private $factory, $manager;

    public function __construct(FormFactory $factory, NovinkyManager $manager)
    {
        $this->manager = $manager;
        $this->factory = $factory;
    }

    public function create(callable $onSuccess) : Form
    {
        $form = $this->factory->create();
        $form->addText("datum")->setHtmlAttribute("type","date")->setHtmlAttribute("placeholder", "Datum")->setRequired();
        $form->addText("nazev")->setHtmlAttribute("placeholder", "Název akce")->setRequired();
        $form->addSubmit("submit", "Přidat Akci");
        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess) : void
        {
            $this->manager->insertAkci($values);
            $onSuccess();
        };
        return $form;
    }

}