<?php


namespace App\Forms;

use App\Model\PisnickyManager;
use Nette\Application\UI\Form;

final class PisnickaFormFactory
{
    private $factory;
    private $manager;
    
    public function __construct(FormFactory $factory, PisnickyManager $manager)
    {
        $this->factory = $factory;
        $this->manager = $manager;
    }

    public function create(callable $onSuccess) : Form
    {
        $form = $this->factory->create();
        $form->addText("nazev")->setRequired()->setHtmlAttribute("placeholder", "Název písničky");
        $form->addTextArea("text")->setHtmlId("summernote")->setRequired()->setHtmlAttribute("placeholder", "Text písničky");
        $form->addRadioList("rytmus", "", ["angola"=>"Angola","benguela"=>"Benguela","saobento"=>"São Bento","samba"=>"Samba","maculele"=>"Maculelê"])->setRequired();
        $form->addText("odkaz")->setHtmlAttribute("placeholder", "Odkaz na YouTube");
        $form->addSubmit("submit","Přidat");
        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess) : void
        {
            $this->manager->insertPisnicka($values);
            $onSuccess();
        };
        return $form;
    }

}