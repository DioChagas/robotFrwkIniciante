*** Settings ***
Documentation   Suíte de testes para demonstrar o uso de Logs
...             no RobotFramework

Library         SeleniumLibrary


*** Variable ***
@{FRUTAS}   maça    banana  morango     tomate

*** Test Case ***
Caso de Teste 01
    Usando LOG para mensagens
    Usando LOG console
    Screenshots dos milagres


*** Keywords ***
Usando LOG para mensagens
    Log     Minha msg de LOG
    ${VAR}  Set Variable    variavel qualquer
    Log     Posso logar uma ${VAR} no meio de um log

Usando LOG console
    Log To Console      Logando saída no console
    Log Many            Posso logar minha lista inteira @{FRUTAS}
    Log                 Posso logar somente alguns itens da lista ${FRUTAS[1]} - ${FRUTAS[2]}

Screenshots dos milagres
    Open Browser        https://globoesporte.globo.com/     chrome
    Capture Page Screenshot
    Close Browser