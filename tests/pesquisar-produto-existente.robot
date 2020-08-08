*** Settings ***
Documentation               Neste cenário contém passos para realizar uma pesquisa de produtos existentes

Resource                  ../resources/base.robot
Resource                  ../resources/kws.robot

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Realizar uma pesquisa de produtos existentes
    Dado que eu digite "Dress" no campo de pesquisa
    Quando clicar no botao pesquisar
    Entao deve listar o produto "Dress" 

