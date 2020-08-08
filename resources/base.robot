*** Settings ***
Documentation   Aqui estará a base do projeto

Library     SeleniumLibrary

Resource                  kws.robot

*** Variables ***
${base_url}     http://automationpractice.com/index.php

*** Keywords ***
##Hooks
Open Session
    Open Browser    about:blank     chrome
    Go To           ${base_url}

Close Session
    Capture Page Screenshot
    Close Browser


##Helpers para remover produto do carrinho (isto servirá para execução da pré-condição: adicionar produto)
Adicionar produtos
    [Arguments]         ${PRODUTO}
    Open Session

    #pesquisa o produto
    Wait Until Element is Visible   ${SEARCH}
    Input Text                      ${SEARCH}               ${PRODUTO}
    Click Element                   ${BOTAO_PESQUISAR}

    #Põe o produto no carrinho
    Wait Until Page Contains Element        xpath://*[contains(text(),"T-shirts")]
    Click Element                           xpath://*[contains(text(), "Add to cart")]

    #Confirma se o produto foi adicionado no carrinho e redireciona para tela de check-out
    Wait Until Element is Visible           ${CONFIRMAR_ADD_PROD}
    Click Element                           xpath://*[contains(text(), "Proceed to checkout")]      #Confirmar e ir para tela de Checkoout
    Wait Until Page Contains Element        ${DIV_CHECKOUT}