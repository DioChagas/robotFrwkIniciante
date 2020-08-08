*** Settings ***
Documentation               Neste cenário contém passos para adicionar produtos ao carrinho

Resource                  ../resources/base.robot
Resource                  ../resources/kws.robot

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Adicionar produtos no carrinho
    Dado que eu pesquise por "t-shirt"
    E adicione "t-shirt" ao carrinho
    Quando for exibido produto "t-shirt" no carrinho
    Entao devo confirmar a compra e ir para a tela de checkout     
    
    