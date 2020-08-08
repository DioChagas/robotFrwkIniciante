*** Settings ***
Documentation               Neste cenário contém passos para validar mensagem de "Produto não encontrado"

Resource                  ../resources/base.robot
Resource                  ../resources/kws.robot

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Validar mensagem de produto não encontrado
    Dado que eu digite "produtoInexistente"
    Quando pesquisar
    Entao deve retornar a mensagem de erro