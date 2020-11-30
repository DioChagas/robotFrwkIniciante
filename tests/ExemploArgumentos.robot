*** Settings ***
Documentation       Exemplo de uso de variáveis como Argumentos em Keywords

*** Variable ***
&{PESSOA}       nome=Diogenes Chagas   email=diogenes@mail.com     idade=17        sexo=masculino

*** Test Cases ***
Caso de Teste de Exemplo 01
    Imprimir os dados da pessoa

*** Keywords ***
Imprimir os dados da pessoa
    Uma subkeyword com argumentos       ${PESSOA.nome}      ${PESSOA.email}
    ${MENSAGEM_ALERTA}      Uma subkeyword com retorno      ${PESSOA.nome}      ${PESSOA.idade}
    Log To Console      ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}     ${EMAIL_USUARIO}
    Log To Console      Nome do usuário:    ${NOME_USUARIO}
    Log To Console      Email do usuário:   ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}     ${IDADE_USUARIO}
    ${MENSAGEM}     Set Variable If     ${IDADE_USUARIO}<18     Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!
    [Return]        ${MENSAGEM}

