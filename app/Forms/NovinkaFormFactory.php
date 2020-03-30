<?php


namespace App\Forms;

use Nette\Forms\Form;
use App\Model\NovinkyManager;
use App\Model\FotoManager;


final class NovinkaFormFactory
{
    private $formFactory;
    private $novinkyManager;
    private $fotoManager;

    public function __construct(FormFactory $formFactory, NovinkyManager $manager, FotoManager $fotoManager)
    {
        $this->formFactory = $formFactory;
        $this->novinkyManager = $manager;
        $this->fotoManager = $fotoManager;
    }

    public function create(callable $onSuccess, int $id = null) : Form
    {
        $form = $this->formFactory->create();
        $form->addText("nadpis")->setRequired()->setHtmlAttribute("placeholder", "Nadpis");
        $form->addTextArea("text")->setHtmlId("summernote")->setHtmlAttribute("placeholder", "Text novinky");
        $form->addMultiUpload("obrazek");
        $form->addSubmit("submit", "Přidat novinku");
        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess, $id) : void
        {
            $obrazky = $values["obrazek"];
            unset($values["obrazek"]);
            if($id == null){
                $novinka = $this->novinkyManager->insertNovinka($values);
            }else{
                $novinka = $this->novinkyManager->updateNovinka($values, $id);
            }
            if(!empty($obrazky)){
                $this->fotoManager->insertObrazky($obrazky, $novinka->id);
            }


            $onSuccess();
        };

        return $form;
    }

}