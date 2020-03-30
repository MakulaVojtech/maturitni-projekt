<?php

declare(strict_types=1);

namespace App\Forms;

use App\Model;
use Nette;
use Nette\Application\UI\Form;


final class SignUpFormFactory
{
	use Nette\SmartObject;

	private const PASSWORD_MIN_LENGTH = 7;

	/** @var FormFactory */
	private $factory;

	/** @var Model\UserManager */
	private $userManager;


	public function __construct(FormFactory $factory, Model\UserManager $userManager)
	{
		$this->factory = $factory;
		$this->userManager = $userManager;
	}


	public function create(callable $onSuccess): Form
	{
		$form = $this->factory->create();
		$form->addText('login')
            ->setHtmlAttribute("Uživatelské jméno")
            ->setHtmlId("loginName")
			->setRequired('Zadejte své uživatelské jméno.');


        $form->addPassword("heslo")->setRequired("Prosím vyplňte své heslo")
            ->setHtmlAttribute("placeholder", "Heslo")
            ->setHtmlId("password")
            ->addRule(Form::PATTERN, 'Heslo musí být dlouhé nejméně osm znaků, musí obsahovat malé i velké písmeno a číslici.', "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$");

        $form->addPassword("hesloZnovu")->setRequired("Zadejte své heslo znovu")
            ->setHtmlAttribute("placeholder", "Heslo znovu")
            ->setHtmlId("passAgain")
            ->addRule(Form::EQUAL, "Hesla se neshodují", $form["heslo"]);

        $form->addReCaptcha(
            'captcha', // control name
            '', // label
            "Opravdu nejsi robot? ;)" // error message
        );

		$form->addSubmit('send', 'Registrovat');

		$form->onSuccess[] = function (Form $form, \stdClass $values) use ($onSuccess): void {
			try {
				$this->userManager->add($values->login, $values->heslo);
			} catch (Model\DuplicateNameException $e) {
				$form['login']->addError('Tento login je již bohužel zabraný.');
				return;
			}
			$onSuccess();
		};

		return $form;
	}
}
