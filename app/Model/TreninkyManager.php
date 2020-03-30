<?php


namespace App\Model;

use Nette\Database;

class TreninkyManager
{
    private $database;

    public function __construct(Database\Context $database)
    {
        $this->database = $database;
    }

    public function getTreninky() : array
    {
        $i = 0;
        $dny = [];
        foreach($this->database->table("trenink")->select("den")->group("den") as $den){
            $dny[$i]["den"] = $den->den;
            $dny[$i]["trenink"] = $this->database->query("select skupina.nazev, skupina.popis, trenink.cas_zacatek, trenink.cas_konec from trenink, skupina where skupina.id = trenink.skupina_id and trenink.den = ?", $den->den);
            $i++;
        }
        return $dny;
    }

    public function getTreninkyAdmin() : array
    {
        $skupiny = $this->database->query("select * from skupina");

        $skupiny_array = [];
        $i = 0;
        foreach ($skupiny as $skupina){
            $skupiny_array[$i]["id"] = $skupina->id;
            $skupiny_array[$i]["nazev"] = $skupina->nazev;
            $skupiny_array[$i]["ceny"] = $this->database->query("select * from cena where skupina_id = ?", $skupina->id);
            $skupiny_array[$i]["treninky"] = $this->database->query("select * from trenink where skupina_id = ?", $skupina->id);
            $i++;
        }
        return $skupiny_array;
    }

    public function getSkupiny() : Database\Table\Selection
    {
       return $this->database->table("skupina");
    }

    public function deleteSkupina(int $id) : void
    {
        $skupina = $this->database->table("skupina")->get($id);

        if(!$skupina){
            throw new \Exception("Skupina s tímto id neexistuje! ", 404);
        }else{
            $this->database->table("cena")->where("skupina_id = ?", $id)->delete();
             $this->database->table("trenink")->where("skupina_id = ?", $id)->delete();
            $skupina->delete();
        }
    }

    public function deleteTrenink(int $id) : void
    {
        $trenink = $this->database->table("trenink")->get($id);

        if(!$trenink){
            throw new \Exception("Trénink s tímto id neexistuje! ", 404);
        }else{
            $trenink->delete();
        }
    }

    public function insertTrenink(array $values) : void
    {
        $this->database->table("trenink")->insert($values);
    }

    public function insertSkupina(array $values) : void
    {
        $this->database->table("skupina")->insert($values);
    }


}