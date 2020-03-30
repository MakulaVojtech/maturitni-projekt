<?php


namespace App\Forms;

use App\Model\TreninkyManager;
use Nette\Application\UI\Form;

final class TreninkFormFactory
{

    private $factory, $manager;

    public function __construct(FormFactory $factory, TreninkyManager $manager)
    {
        $this->factory = $factory;
        $this->manager = $manager;
    }

    public function create(callable $onSuccess) : Form
    {
        $form = $this->factory->create();
        $skupiny = $this->manager->getSkupiny();
        $form->addText("cas_zacatek", "Čas začátek")->setHtmlAttribute("type","time")->setRequired()->setHtmlAttribute("placeholder","Čas začátek");
        $form->addText("cas_konec", "Čas konec")->setHtmlAttribute("type","time")->setRequired()->setHtmlAttribute("placeholder","Čas konec");
        $form->addSelect("den","", ["Pondělí"=>"Pondělí", "Úterý"=>"Úterý","Středa"=>"Středa","Čtvrtek"=>"Čtvrtek","Pátek"=>"Pátek"])->setRequired();
        $s = [];
        foreach ($skupiny as $skupina){
            $s[$skupina->id] = $skupina->nazev;
        }
        $form->addSelect("skupina_id", "", $s);
        $form->addSubmit("submit", "Odeslat");
        $form->onSuccess[] = function (Form $form, array $values) use ($onSuccess) : void
        {
            $this->manager->insertTrenink($values);
            $onSuccess();
        };
        return $form;
    }

}