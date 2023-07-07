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
      $I->click('Plantas');
      $I->seeCurrentURLEquals('/PlantasMedicinais/inNature/plantas.html');
      $I->amOnPage('/PlantasMedicinais/inNature/planta.html');
      $I->amOnPage('/PlantasMedicinais/inNature/planta.html');
    }
}
