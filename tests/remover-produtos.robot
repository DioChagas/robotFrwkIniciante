*** Settings ***
Documentation               Neste cenário contém passos para remover produtos ao carrinho

Resource                  ../resources/base.robot
Resource                  ../resources/kws.robot

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Remover produtos no carrinho
    Dado que eu adicione um produto ao carrinho
    Quando desistir da compra e remover o produto
    Entao deve retornar a mensagem informando que o carrinho esta vazio
    
    
