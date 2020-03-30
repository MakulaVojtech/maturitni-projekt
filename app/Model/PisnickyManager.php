<?php


namespace App\Model;

use Nette\Database;
use Nette\Security\User;

class PisnickyManager
{
    private $database;
    private $user;

    public function __construct(Database\Context $database, User $user)
    {
        $this->database = $database;
        $this->user = $user;
    }

    public function getPisnicky(string $rytmus = "")
    {
        if ($rytmus == "") {
            $pisnicky =  $this->database->table("pisnicka");
        } elseif ($rytmus == "oblibene") {
            $pisnicky = $this->database->query("SELECT pisnicka.* FROM pisnicka, oblibene_pisnicky, uzivatel WHERE pisnicka.id = oblibene_pisnicky.pisnicka_id AND uzivatel_id = ? GROUP BY oblibene_pisnicky.pisnicka_id", $this->user->getId());
            $pisnicky = $pisnicky->fetchAll();
        } else {
            $pisnicky = $this->database->table("pisnicka")->where("pisnicka.rytmus = ?", $rytmus);
        }
        return $pisnicky;
    }

    public function getPisnicka(int $id) : Database\Table\ActiveRow
    {
            return $this->database->table("pisnicka")->get($id);
    }

    public function like(int $id) : void
    {
        $pisnicka = $this->database->query("SELECT * FROM oblibene_pisnicky WHERE pisnicka_id = ? AND uzivatel_id = ?", $id, $this->user->getId());
        $pisnicka = $pisnicka->fetch();
        if(!$pisnicka){
            $this->database->table("oblibene_pisnicky")->insert(["pisnicka_id" => $id, "uzivatel_id" => $this->user->getId()]);
        }
    }

    public function dislike(int $id) : void
    {
        $this->database->table("oblibene_pisnicky")
            ->where("pisnicka_id = ? AND uzivatel_id = ?", [$id, $this->user->getId()])
            ->delete();
    }

    public function deletePisnicka(Database\Table\ActiveRow $pisnicka) : void
    {
        foreach($pisnicka->related("oblibene_pisnicky") as $oblibena){
            $oblibena->delete();
        }
        $pisnicka->delete();
    }

    public function insertPisnicka(array $values) : void {
        $strings = explode("=",$values["odkaz"]);

        $values["odkaz"] = "https://www.youtube.com/embed/". $strings[1];
        $this->database->table("pisnicka")->insert($values);
    }
}