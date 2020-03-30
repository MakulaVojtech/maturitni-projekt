<?php


namespace App\Forms;

use App\Model\TreneriManager;
use Nette\Forms\Form;
use Tracy\Debugger;


class TrenerFormFactory
{
    private $factory;
    private $manager;

    public function __construct(FormFactory $factory, TreneriManager $manager)
    {
        $this->factory = $factory;
        $this->manager = $manager;
    }

    public function create(callable $onSuccess, int $id = null) : Form
    {
        $form = $this->factory->create();
        $form->addText("jmeno")
            ->setRequired()
            ->setHtmlAttribute("placeholder", "Jméno");
        $form->addText("prijmeni")
            ->setRequired()
            ->setHtmlAttribute("placeholder", "Příjmení");
        $form->addText("prezdivka")
            ->setHtmlAttribute("placeholder", "Přezdívka");
        $form->addEmail("email")
            ->setRequired()
            ->setHtmlAttribute("placeholder", "e-mail");
        $form->addInteger("telefon")
            ->setRequired()
            ->setHtmlAttribute("placeholder", "Telefonní číslo");
        $form->addTextArea("popis")->setHtmlId("summernote");
        $form->addUpload("obrazek_id");
        $form->addSubmit("submit", "Přidat");
        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess, $id) : void
        {
            if($id == null){
                $this->manager->insertTrener($values);
            }else{
                $this->manager->updateTrener($values, $id);
            }
            $onSuccess();
        };
        return $form;
    }

}