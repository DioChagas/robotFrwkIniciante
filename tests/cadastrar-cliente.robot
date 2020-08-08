*** Settings ***
Documentation               Neste cenário contém passos para acessar a página de login 
...                         e cadastrar um novo cliente

Resource                  ../resources/base.robot
Resource                  ../resources/kws.robot

Test Setup      Open Session
Test Teardown   Close Session

*** Test Cases ***
Cadastrar novo usuario
# Acessar pagina de Login
    Dado que solicite fazer login no sistema
    Quando clicar no botao signIn
    E for redirecionado para a pagina de login

# Solicitar novo cadastro
    E informar o email "emailvalido@ssaassd.com"
    Quando clicar para criar usuario
    E for redirecionado para a pagina de cadastro


# Cadastrar novo usuario
    Quando preencher todos os campos obrigatorios
    Entao usuario deve ser cadastrado com sucesso
