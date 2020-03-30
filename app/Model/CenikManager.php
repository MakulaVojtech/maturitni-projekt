<?php


namespace App\Model;

use Nette\Database;

class CenikManager
{
    private $database;

    public function __construct(Database\Context $database)
    {
        $this->database = $database;
    }

    public function getCenik() : array
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

    public function insertCena(array $values) : void
    {
        $this->database->table("cena")->insert($values);
    }

    public function deleteCena(int $id) : void
    {
        $trenink = $this->database->table("cena")->get($id);

        if(!$trenink){
            throw new \Exception("Cena s tímto id neexistuje! ", 404);
        }else{
            $trenink->delete();
        }
    }

}