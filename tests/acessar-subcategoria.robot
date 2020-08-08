*** Settings ***
Documentation       Neste cenário será contém os passos 
...                 para acessar a subcategoria "Summer Dresses"

Resource                  ../resources/base.robot
Resource                  ../resources/kws.robot

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Acessar pagina Summer Dresses
    Dado que eu acesse a categoria "Women"
    E em seguida a subcategoria "Summer Dresses"
    Entao devo ir para página "Summer Dresses"
