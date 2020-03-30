<?php


namespace App\Forms;

use App\Model\FotoManager;
use Nette\Application\UI\Form;

final class GalerieFormFactory
{
    private $manager;
    private $factory;

    public function __construct(FotoManager $manager, FormFactory $factory)
    {
        $this->manager = $manager;
        $this->factory = $factory;
    }

    public function create(callable $onSuccess, int $id = null) :Form
    {
        $form = $this->factory->create();
        $form->addText("nazev")
            ->setRequired()
            ->setHtmlAttribute("placeholder", "Název galerie");
        $form->addText("popis")
            ->setHtmlAttribute("placeholder", "Popis galerie");
        $form->addMultiUpload("obrazky");
        $form->addSubmit("submit", "Přidat");

        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess, $id) : void
        {
            if($id == null){
                $this->manager->insertGalerie($values);
            }else{
                $this->manager->updateGalerie($values, $id);
            }
            $onSuccess();


        };

        return $form;
    }

}