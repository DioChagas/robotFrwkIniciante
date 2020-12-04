*** Settings ***
Documentation       Exemplo de uso de variáveis como Argumentos em Keywords

*** Variable ***
&{PESSOA}       nome=Diogenes Chagas   email=diogenes@mail.com     idade=17        sexo=masculino

*** Test Cases ***
Caso de Teste de Exemplo 01
    Imprimir os dados da pessoa

*** Test Cases ***
Caso de Teste de Exemplo 02
    Imprimir email

*** Keywords ***

Imprimir email
    [Arguments]     ${NOME}     ${SOBRENOME}
    ${STRING_ALEATORIA}     Generate Random String
    ${CUSTOM_EMAIL}     Set Variable    ${NOME}${SOBRENOME}${STRING_ALEATORIA}@testrobot.com

    Log To Console  ${CUSTOM_EMAIL}
    [Return]          ${CUSTOM_EMAIL}