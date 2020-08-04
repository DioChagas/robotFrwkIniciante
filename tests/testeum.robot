*** Settings ***
Documentation       Abrir página e fazer uam pesquisa


Library     SeleniumLibrary

Test Setup      Open Session
Test Teardown   Close Session

*** Variable ***
${url}          http://automationpractice.com/index.php

*** Test Cases ***
Acessar pagina
    Dado que eu acesse a página da moda mudelo
    

*** Keywords ***
##Hooks
Open Session
    Open Browser    about:blank     chrome

Close Session
    Capture Page Screenshot
    Close Browser

Dado que eu acesse a página da moda mudelo
    Go To           ${url}    