<?php

declare(strict_types=1);

namespace App\Forms;

use Nette;
use Nette\Application\UI\Form;
use Nette\Security\User;


final class SignInFormFactory
{
	use Nette\SmartObject;

	/** @var FormFactory */
	private $factory;

	/** @var User */
	private $user;


	public function __construct(FormFactory $factory, User $user)
	{
		$this->factory = $factory;
		$this->user = $user;
	}


	public function create(callable $onSuccess): Form
	{
		$form = $this->factory->create();
		$form->addText('login')
            ->setHtmlAttribute("placeholder", "Uživatelské jméno")
			->setRequired('Please enter your username.');

		$form->addPassword('heslo')
            ->setHtmlAttribute("placeholder", "Heslo")
			->setRequired('Please enter your password.');

		$form->addCheckbox('remember', 'Zůstat přihlášen');

        $form->addReCaptcha(
            'captcha', // control name
            '', // label
            "Opravdu nejsi robot? ;)" // error message
        );

		$form->addSubmit('send', 'Přihlásit');

		$form->onSuccess[] = function (Form $form, \stdClass $values) use ($onSuccess): void {
			try {
				$this->user->setExpiration($values->remember ? '14 days' : '20 minutes');
				$this->user->login($values->login, $values->heslo);
			} catch (Nette\Security\AuthenticationException $e) {
				$form->addError('Zadané heslo, nebo jméno je nesprávné.');
				return;
			}
			$onSuccess();
		};

		return $form;
	}
}
