*** Settings ***
Documentation       Listar produtos

Resource                  ../resources/base.robot
Resource                  ../resources/kws.robot

Test Setup      Open Session
Test Teardown   Close Session
   

*** Test Cases ***
Acessar pagina Summer Dresses
    Dado que eu acesse a página da moda mudelo
    Acesse a categoria "Women"
    E em seguida a subcategoria "Summer Dresses"
    Entao devo ir para página "Summer Dresses"
