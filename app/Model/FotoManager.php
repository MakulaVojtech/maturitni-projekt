<?php


namespace App\Model;

use Nette\Database;
use Nette\Utils\Image;

class FotoManager
{
    private $database;

    public function __construct(Database\Context $database)
    {
        $this->database = $database;
    }

    public function getAlba() : array
    {
        $alba = $this->database->table("album");
        $return = [];
        foreach ($alba as $album){
            $count = $this->database->query("SELECT count(*) as count FROM obrazek, album, obrazek_has_album WHERE obrazek.id = obrazek_has_album.obrazek_id AND obrazek_has_album.album_id = ? GROUP BY obrazek.id", $album->id);
            $count = $count->fetch();
            if(null != $count){
                $obrazek =  $this->database->query("SELECT obrazek.nazev, obrazek.id FROM obrazek, album, obrazek_has_album WHERE obrazek.id = obrazek_has_album.obrazek_id AND obrazek_has_album.album_id = ? GROUP BY obrazek.id LIMIT 1", $album->id);
                $obrazek = $obrazek->fetch();
                $return[]= ["album"=>$album, "obrazek"=>$obrazek];
            }
        }
        return $return;
    }

    public function getAlbum(int $id) : array
    {
        $returnArray = [];
        $album = $this->database->table("album")->get($id);
        $obrazky = $this->database->query("SELECT obrazek.nazev, obrazek.id FROM obrazek, album, obrazek_has_album WHERE obrazek.id = obrazek_has_album.obrazek_id AND obrazek_has_album.album_id = ? GROUP BY obrazek.id", $id);

        if($album && $obrazky){
            $returnArray["album"] = $album;
            $returnArray["obrazky"] = $obrazky;
        }
        return $returnArray;
    }
    public function uploadImage($obrazek)
    {
        if($obrazek->isImage() && $obrazek->isOk()) {

            $file_ext = substr(strrchr($obrazek->name,'.'),1);
            $filename = uniqid(rand(0, 20), TRUE) .".". $file_ext;
            $obrazek->move("./images/" . $filename);
            $img = Image::fromFile("./images/" . $filename);
            $img->resize("300", null);
            $img->sharpen();
            $img->save("./images/thumbs/" . $filename);
            return $filename;
        }
    }
    public function deleteImage(int $id) : void
    {
        $img = $this->database->table("obrazek")->get($id);
        unlink("./images/thumbs/$img->nazev");
        unlink("./images/$img->nazev");
        $img->delete();
    }

    public function insertObrazky(array $obrazky, int $id, string $where = "novinka") : void
    {
        if(!empty($obrazky) && !empty($id)){
            foreach ($obrazky as $obrazek){
                if($obrazek->isImage() && $obrazek->isOk()){
                    $filename = $this->uploadImage($obrazek);
                   $img_in_db = $this->database->table("obrazek")->insert(["nazev"=>$filename]);
                    if($where == "novinka"){
                        $this->database->table("novinka_has_obrazek")->insert(["novinka_id"=>$id, "obrazek_id"=>$img_in_db->id]);
                    }elseif ($where == "galerie"){
                        $this->database->table("obrazek_has_album")->insert(["album_id"=>$id,"obrazek_id"=>$img_in_db->id]);
                    }
                }
            }
        }
    }

    public function deleteObrazek(int $id, array $params = ["novinka_id"=> null, "album_id"=>null]) : void
    {
        if($params["novinka_id"] != null){
            $this->database->table("novinka_has_obrazek")->where("obrazek_id", $id)->delete();
        }elseif($params["album_id"] != null){
            $this->database->table("obrazek_has_album")->where("obrazek_id", $id)->delete();
        }
        $this->deleteImage($id);
    }

    public function insertGalerie(array $values) : void
    {
        $galerie =  $this->database->table("album")->insert(["nazev"=>$values["nazev"], "popis"=>$values["popis"]]);
        $this->insertObrazky($values["obrazky"], $galerie->id, "galerie");
    }

    public function updateGalerie(array $values, int $id) : void
    {
        $galerie =  $this->database->table("album")->get($id)->update(["nazev"=>$values["nazev"], "popis"=>$values["popis"]]);
        $this->insertObrazky($values["obrazky"], $id, "galerie");

    }

    public function deleteGalerie(int $id) : void
    {
        $galerie = $this->getAlbum($id);
        foreach ($galerie["obrazky"] as $obrazek){
            $this->deleteObrazek($obrazek->id, ["novinka_id"=>null,"album_id"=>$id]);
        }
        $galerie["album"]->delete();
    }
}