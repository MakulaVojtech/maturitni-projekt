<?php


namespace App\Model;

use Nette\Database;

class TreneriManager
{
    private $database;
    private $fotoManager;

    public function __construct(Database\Context $database, FotoManager $manager)
    {
        $this->database = $database;
        $this->fotoManager = $manager;
    }


    public function getTreneri() : Database\ResultSet
    {
        return $this->database->query("SELECT trener.id, trener.jmeno, trener.prijmeni, trener.prezdivka, obrazek.nazev FROM trener, obrazek WHERE obrazek.id = trener.obrazek_id");
    }

    public function getTrener($id) : array
    {
        $returnArray = [];
        $trener = $this->database->table("trener")->get($id);
        if($trener){
            $returnArray["trener"] = $trener;
            $returnArray["obrazek"] = $this->database->table("obrazek")->where("id = ?", $trener->obrazek_id)->fetch();
        }
        return $returnArray;
    }
    public function insertTrener(array $values) : void
    {
        $obrazek = $values["obrazek_id"];
        $obrazek = $this->fotoManager->uploadImage($obrazek);
        $obrazek = $this->database->table("obrazek")->insert(["nazev"=>$obrazek]);
        $values["obrazek_id"] = $obrazek->id;
        $this->database->table("trener")->insert($values);
    }
    public function updateTrener(array $values, int $id) : void
    {
        $trener = $this->getTrener($id)["trener"];
        if($values["obrazek_id"]->error != 4){
                $stareId = $trener->obrazek_id;
                $obrazek = $values["obrazek_id"];
                $obrazek = $this->fotoManager->uploadImage($obrazek);
                $obrazek = $this->database->table("obrazek")->insert(["nazev" => $obrazek]);
                $values["obrazek_id"] = $obrazek->id;
                $this->database->table("trener")->get($id)->update($values);
                $this->fotoManager->deleteImage($stareId);
            }else{
                unset($values["obrazek_id"]);
                $this->database->table("trener")->get($id)->update($values);
            }
    }
    public function deleteTrener(int $id) : void
    {
       $trener = $this->database->table("trener")->get($id);
       $imgId = $trener->obrazek_id;
        $trener->delete();
       $this->fotoManager->deleteImage($imgId);
    }
}