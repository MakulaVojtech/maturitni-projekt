<?php


namespace App\Presenters;

use App\Model;
use App\Forms;
use Nette\Application\UI\Form;

final class AdminPresenter extends BasePresenter
{
    private $novinkyManager,
     $fotoManager,
     $novinkaFormFactory,
     $userManager,
     $treninkyManager,
     $cenovkaFormFactory,
     $cenikManager,
     $treninkFormFactory,
    $skupinaFormFactory,
    $treneriManager,
    $trenerFormFactory,
    $galerieFormFactory,
    $pisnickyManager,
    $pisnickaFormFactory,
    $akceFormFactory;


    public function __construct(Model\NovinkyManager $novinkyManager,
                                Forms\NovinkaFormFactory $novinkaFormFactory,
                                Model\FotoManager $fotoManager,
                                Model\UserManager $userManager,
                                Model\TreninkyManager $treninkyManager,
                                Forms\CenovkaFormFactory $cenovkaFormFactory,
                                Model\CenikManager $cenikManager,
                                Forms\TreninkFormFactory $treninkFormFactory,
                                Model\TreneriManager $treneriManager,
                                Forms\TrenerFormFactory $trenerFormFactory,
                                Forms\GalerieFormFactory $galerieFormFactory,
                                Model\PisnickyManager $pisnickyManager,
                                Forms\PisnickaFormFactory $pisnickaFormFactory,
                                Forms\AkceFormFactory $akceFormFactory,
                                Forms\SkupinaFormFactory $skupinaFormFactory)
    {
        $this->novinkyManager = $novinkyManager;
        $this->fotoManager = $fotoManager;
        $this->novinkaFormFactory = $novinkaFormFactory;
        $this->userManager = $userManager;
        $this->treninkyManager = $treninkyManager;
        $this->cenovkaFormFactory = $cenovkaFormFactory;
        $this->cenikManager = $cenikManager;
        $this->treninkFormFactory = $treninkFormFactory ;
        $this->skupinaFormFactory = $skupinaFormFactory;
        $this->treneriManager = $treneriManager;
        $this->trenerFormFactory = $trenerFormFactory;
        $this->galerieFormFactory = $galerieFormFactory;
        $this->pisnickyManager = $pisnickyManager;
        $this->pisnickaFormFactory = $pisnickaFormFactory;
        $this->akceFormFactory = $akceFormFactory;
    }

    public function beforeRender() : void
    {
        if(!$this->user->isInRole("admin")){
            $this->redirect("Homepage:default");
        }
    }

    public function renderDefault() : void
    {
        $this->template->novinky = $this->novinkyManager->getNovinky(null,true);
    }

    public function handleSkrytNovinku(int $id) : void
    {
        $this->novinkyManager->hideNovinka($id);
    }

    public function createComponentNovinkaForm() : Form
    {
        $id = $this->getParameter("id");
        if(!isset($id)){
            $id = null;
        }
        return  $this->novinkaFormFactory->create(function (){
            $this->flashMessage("Novinka úspěšně publikována!", "success");
            $this->redirect("Admin:Default");
        }, $id);
        
    }

    public function renderUpravitNovinku(int $id) :void
    {
        $novinka = $this->novinkyManager->getNovinka($id, false);
        if(!$novinka){
            $this->flashMessage("Novinka s tímto id neexistuje!", "error");
            $this->redirect("Admin:default");
        }else{
            $this["novinkaForm"]->setDefaults($novinka["novinka"]->toArray());
            $this->template->obrazky = $novinka["obrazky"];
        }
    }

    public function actionSmazatNovinku(int $id) : void
    {
        $novinka = $this->novinkyManager->getNovinka($id, false);
        if($novinka["novinka"]->smazatelna == 0){
            $this->flashMessage("Tuto novinku není možné smazat!", "error");
            $this->redirect("Admin:default");
        }else{
            $this->novinkyManager->deleteNovinka($novinka);
            $this->flashMessage("Novinka úspěšně smazána.", "success");
            $this->redirect("Admin:default");
        }
    }

    public function actionSmazatObrazekZNovinky(int $idObrazku, int $idNovinky) : void
    {
        $this->fotoManager->deleteObrazek($idObrazku, ["novinka_id"=>$idNovinky]);
        $this->flashMessage("Obrázek úspěšně smazán", "success");
        $this->redirect("Admin:upravitNovinku", $idNovinky);
    }


    public function renderUzivatele() : void
    {
        if(!$this->user->isInRole("superAdmin")){
            $this->redirect("Admin:default");
        }else{
            $this->template->uzivatele = $this->userManager->getUzivatele();
        }
    }

    public function handleDatAdmina(int $id) : void
    {
        $this->userManager->makeUzivatelAdmin($id);
    }

    public function  handleSmazatUzivatele(int $id) : void
    {
        $this->userManager->deleteUzivatel($id);
    }

    public function renderTreninky(){
        $this->template->skupiny = $this->treninkyManager->getTreninkyAdmin();
    }

    public function handleSmazatSkupinu(int $id) : void
    {
        try {
            $this->treninkyManager->deleteSkupina($id);
            $this->flashMessage("skupina úspěšně smazána.", "success");
        }catch (\Exception $e){
            $this->flashMessage($e->getMessage(), "error");
        }
    }

    public function handleSmazatTrenink(int $id) : void
    {
        try {
            $this->treninkyManager->deleteTrenink($id);
            $this->flashMessage("Trénink úspěšně smazán.", "success");
        }catch (\Exception $e){
            $this->flashMessage($e->getMessage(), "error");
        }
    }

    public function handleSmazatCenu(int $id) : void
    {
        try {
            $this->cenikManager->deleteCena($id);
            $this->flashMessage("Cena úspěšně smazána.", "success");
        }catch (\Exception $e){
            $this->flashMessage($e->getMessage(), "error");
        }
    }

    public function createComponentPridatCenovkuForm() : Form
    {
        return $this->cenovkaFormFactory->create(function (){
            $this->flashMessage("Cenovka úspěšně přidána.", "success");
            $this->redirect("Admin:treninky");
        });
    }

    public function createComponentPridatTreninkForm() : Form
    {
        return $this->treninkFormFactory->create(function (){
            $this->flashMessage("Trénink úspěšně přidán. ", "success");
            $this->redirect("Admin:treninky");
        });
    }

    public function createComponentSkupinaForm() : Form
    {
        return $this->skupinaFormFactory->create(function (){
            $this->flashMessage("Skupina úspěšně přidána.", "success");
            $this->redirect("Admin:treninky");
        });
    }

    public function renderTreneri() : void
    {
        $this->template->treneri = $this->treneriManager->getTreneri();
    }

    public function createComponentTrenerForm() : Form
    {
        $id = $this->getParameter("id");
        $onSuccess = function () {
            $this->flashMessage(isset($_GET["id"]) ? "Trenér úspěšně upraven." : "Trenér úspěšně přidán.", "success");
            $this->redirect("Admin:treneri");
        };
        if(isset($id)){
           return $this->trenerFormFactory->create($onSuccess, $id);
        }else{
            return $this->trenerFormFactory->create($onSuccess);
        }
    }

    public function actionUpravitTrenera(int $id) : void
    {
        $trener = $this->treneriManager->getTrener($id);
        if(!$trener){
            $this->flashMessage("Trenér s tímto id neexistuje.", "error");
            $this->redirect("Admin:treneri");
        }else{
            $this["trenerForm"]->setDefaults($trener["trener"]);
        }
    }

    public function handleSmazatTrenera(int $id) : void
    {
        $trener = $this->treneriManager->getTrener($id);
        if(!$trener){
            $this->flashMessage("Trenér s tímto id neexistuje.", "error");
            $this->redirect("Admin:treneri");
        }else{
            $this->treneriManager->deleteTrener($id);
            $this->flashMessage("Trenér úspěšně smazán! ");
        }
    }


    public function renderFotogalerie() : void
    {
        $this->template->fotogalerie = $this->fotoManager->getAlba();
    }

    public function createComponentGalerieForm() : Form
    {
        $id = $this->getParameter("id");
        
        $onSuccess = function () {
            $this->flashMessage(isset($_GET["id"]) ? "Galerie úspěšně upravena." : "Galerie úspěšně přidána.", "success");
            $this->redirect("Admin:fotogalerie");
        };
        if(isset($id)){
            return $this->galerieFormFactory->create($onSuccess, $id);
        }else{
            return $this->galerieFormFactory->create($onSuccess);
        }
    }

    public function actionUpravitGalerii(int $id) : void
    {
        $galerie = $this->fotoManager->getAlbum($id);
        if(empty($galerie)){
            $this->flashMessage("Fotogalerie s tímto id neexistuje. ", "error");
            $this->redirect("Admin:fotogalerie");
        }else{
            $this["galerieForm"]->setDefaults($galerie["album"]->toArray());
            $this->template->obrazky = $galerie["obrazky"];
            $this->template->galerie = $galerie["album"];
        }
    }

    public function handleSmazatAlbum(int $id) : void
    {
        $galerie = $this->fotoManager->getAlbum($id);
        if(empty($galerie)){
            $this->flashMessage("Fotogalerie s tímto id neexistuje. ", "error");
            $this->redirect("Admin:fotogalerie");
        }else{
            $this->fotoManager->deleteGalerie($id);
            $this->flashMessage("Fotogalerie úspěšně smazána.", "success");
        }
    }

    public function actionSmazatObrazek(int $obrazekId, int $galerieId) : void
    {
        $this->fotoManager->deleteObrazek($obrazekId, ["novinka_id"=>null,"album_id"=>$galerieId]);
        $this->flashMessage("Obrazek úspěšně smazán.", "success");
        $this->redirect("Admin:upravitGalerii", $galerieId);
    }

    public function renderPisnicky() : void
    {
        $this->template->pisnicky = $this->pisnickyManager->getPisnicky();
    }

    public function createComponentPisnickaForm() : Form
    {
        return $this->pisnickaFormFactory->create(function (){
            $this->flashMessage("Písnička úspěšně přidána.", "success");
            $this->redirect("Admin:pisnicky");
        });
    }

    public function handleSmazatPisnicku(int $id) : void
    {
        try {
            $pisnicka = $this->pisnickyManager->getPisnicka($id);
        }catch (\TypeError $e){
            $this->flashMessage("Písnička s tímto id neexistuje.", "error");
            $this->redirect("Admin:pisnicky");
        }
        if($pisnicka){
            $this->pisnickyManager->deletePisnicka($pisnicka);
            $this->flashMessage("Písnička úspěšně smazána.", "success");
        }
    }

    public function renderAkce() : void
    {
        $this->template->akce = $this->novinkyManager->getAkce();
    }

    public function createComponentAkceForm() : Form
    {
        return  $this->akceFormFactory->create(function (){
            $this->flashMessage("Akce úspěšně přidána.", "success");
            $this->redirect("Admin:akce");
        });
    }

    public function handleSmazatAkci(int $id) : void
    {
        try {
            $akce = $this->novinkyManager->getAkci($id);
        }catch (\TypeError $e){
            $this->flashMessage("Akce s tímto id neexistuje.", "error");
            $this->redirect("Admin:akce");
        }
        if($akce){
            $this->novinkyManager->deleteAkci($akce);
            $this->flashMessage("Akce úspěšně smazána.", "success");
        }
    }
}