<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use App\Forms;
use Nette\Application\UI\Form;
use App\Model\UserManager;


/**
 * Base presenter for all application presenters.
 */
 class BasePresenter extends Nette\Application\UI\Presenter
{

    public $backlink = '';
    private $signInFactory;
    private $signUpFactory;
    private $userManager;


    public function injectSignInFactory(Forms\SignInFormFactory $signInFactory) : void
    {
        $this->signInFactory = $signInFactory;
    }
    public function injectSignUpFactory(Forms\SignUpFormFactory $signUpFormFactory) : void
    {
        $this->signUpFactory = $signUpFormFactory;
    }

    public function injectUserManager(UserManager $manager){
        $this->userManager = $manager;
    }

    protected function createComponentSignInForm(): Form
    {
        return $this->signInFactory->create(function (): void {
            $this->restoreRequest($this->backlink);
            $this->flashMessage("Přihlášení proběhlo úspěšně.", "success");
            $this->redirect('Homepage:');
        });
    }

    protected function createComponentSignUpForm(): Form
    {
        return $this->signUpFactory->create(function (): void {
            $this->flashMessage("Přihlášení proběhlo úspěšně, nyní se můžete přihlásit.", "success");
            $this->redirect('Homepage:');
        });
    }

    protected function handleRegistraceForm($input){
        if($this->isAjax()){
            $username = $this->userManager->getUzivatelByLogin($input);
            if($username){
                echo 1;
            }else{
                echo 0;
            }
        }
    }


}
