<?php


namespace Tests\Acceptance;

use Tests\Support\AcceptanceTester;

class BuscaCest
{
    public function _before(AcceptanceTester $I)
    {
    }

    // tests
    public function buscarResultadosNaPaginaTest(AcceptanceTester $I)
    {
      $I = new AcceptanceTester($scenario);
      $I->amOnPage('/PlantasMedicinais/inNature/index.html');
      $I->click('');
      $I->seeCurrentURLEquals('/PlantasMedicinais/inNature/cadastro-usuario.html');
      $I->fillField('cd_nome', 'Sae23');
      $I->fillField('cd_email', 'sae23@gmail.com');
      $I->fillField('cd_senha', 'Sae2323');
      $I->fillField('cd_senha_confirmar', 'Sae2323');
      $I->click('Cadastrar');
      $I->seeCurrentURLEquals('/PlantasMedicinais/inNature/usuario.html');
      $I->amOnPage('/PlantasMedicinais/inNature/usuario.html');
      $I->amOnPage('/PlantasMedicinais/inNature/usuario.html');
    }
}
