<?php


namespace App\Model;

use Nette\Database;
use Nette\Security\User;

class NovinkyManager
{

    private $database;
    private $user;
    private $fotoManager;

    public function __construct(User $user, Database\Context $database, FotoManager $fotoManager)
    {
       $this->database = $database;
       $this->user = $user;
       $this->fotoManager = $fotoManager;
    }

    public function getNovinky(int $limit = null, bool $administrace = false) : Database\Table\Selection
    {
        if($administrace){
            $novinky = $this->database->table("novinka");
        }else{
            $novinky = $this->database->table("novinka")->where("viditelna = ? AND smazatelna = ?", [1,1]);
        }
        $novinky->order("vytvoreno DESC");
        if($limit != null){
            $novinky->limit($limit);
        }
        return $novinky;
    }

    public function getNovinka(int $id, bool $vypis = true) : array
    {
        $novinka  = $this->database->table("novinka")->get($id);
        if(!$novinka){
            $returnArr = [];
        }else{
            $obrazky = [];
            $imgs = $novinka->related("novinka_has_obrazek");
           if($vypis){
               foreach ($imgs as $obrazek){
                   $obrazky[] = $obrazek->obrazek->nazev;
               }
           }else{
               foreach ($imgs as $obrazek){
                   $obrazky[] = $obrazek->obrazek;
               }
           }
           $uzivatel = $novinka->ref("uzivatel")->login;
           $returnArr = ["novinka"=>$novinka,"uzivatel"=>$uzivatel,"obrazky"=>$obrazky];
        }
        return $returnArr;
    }

    public function getInfo() : Database\Table\Selection
    {
        return $this->database->table("novinka")
            ->where("id >=4 AND id <=8 ");
    }

    public function getAkce() : Database\Table\Selection
    {
        return $this->database->table("akce")->order("datum");
    }

    public function getAkci(int $id) : Database\Table\ActiveRow
    {
        return $this->database->table("akce")->get($id);
    }

    public function deleteAkci(Database\Table\ActiveRow $akce) : void
    {
        $akce->delete();
    }

    public function insertAkci(array $values) : void
    {
        $this->database->table("akce")->insert($values);
    }

    public function hideNovinka(int $id) : void
    {
        $novinka = $this->database->table("novinka")->get($id);
        $viditelna = $novinka->viditelna == 1 ? 0 : 1;
        $novinka->update(["viditelna"=>$viditelna]);
    }

    public function insertNovinka(array $values) : Database\Table\ActiveRow
    {
        $values["uzivatel_id"] = $this->user->getId();
        $novinka = $this->database->table("novinka")->insert($values);
        return $novinka;
    }

    public function updateNovinka(array $values, int $id) : Database\Table\ActiveRow
    {
        $values["uzivatel_id"] = $this->user->getId();
        $novinka = $this->database->table("novinka")->get($id);
        $novinka->update($values);
        return $novinka;
    }

    public function deleteNovinka(array $novinka) : void
    {
        $obrazky = $novinka["obrazky"];
       if(!empty($novinka["obrazky"])){
           foreach ($obrazky as $obrazek){
               $this->database->table("novinka_has_obrazek")->where("obrazek_id",$obrazek->id)->delete();
               $this->fotoManager->deleteObrazek($obrazek->id);
           }
       }
        $novinka["novinka"]->delete();
    }

}