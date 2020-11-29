*** Settings ***
Documentation       Aqui ficarão as palavras-chaves

Resource            elements.robot
Resource            base.robot

*** Variables ***
&{CLIENTE}  nome=NomeUm     sobrenome=NomeDois      endereco=Rua sem nome e sem numero      cidade=New York
...         estado=9    CEP=00000   pais=21     telefone=1234567890     alias=Rua sem nome e sem calcada

# &{ENDERECO_CLIENTE}     nome_secao=NomeUm

*** Keywords ***
##CENÁRIO 01 - Buscar Produto existente
Dado que eu digite "${PRODUTO}" no campo de pesquisa
    Set Test Variable                   ${PRODUTO}      ##Declarando a variável no contexto de teste (será usada mais de uma vez)

    Wait Until Element is Visible       ${SEARCH}
    Input Text                          ${SEARCH}       Dresses     

Quando clicar no botao pesquisar
    Click Element              ${BOTAO_PESQUISAR}

Entao deve listar o produto "${PRODUTO}" 
    Wait Until Page Contains Element            xpath://*[@id="center_column"]/h1/span[contains(text(),"Dresses")]
# ==================================================================================

##CENÁRIO 02 - Buscar Produto INexistente
Dado que eu digite "${PRODUTO}"
    Wait Until Element is Visible       ${SEARCH}
    Input Text                          ${SEARCH}       produtoInexistente

Quando pesquisar
    Click Element               ${BOTAO_PESQUISAR}

Entao deve retornar a mensagem de erro
    Set Test Variable               ${DIV_ALERT}
    Wait Until Element Contains     ${DIV_ALERT}     ${MSG_PRODUTO_INEXISTENTE}
# ==================================================================================

##CENÁRIO 03 - Acessando página de "Summer Dresses"
Dado que eu acesse a categoria "${CATEGORIA}"
    Wait Until Element Is Visible           xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Mouse Over                              xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

E em seguida a subcategoria "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]
    Click Element                           xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]

Entao devo ir para página "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="center_column"]/h1/span[contains(text(),"Summer Dresses")]
# ==================================================================================

##CENÁRIOS 04 e 05 - Adicionando (CENÁRIO 04) e REMOVENDO (CENÁRIO 05) produtos no carrinho

    ##  CENÁRIO 04 - ADD NO CARRINHO
Dado que eu pesquise por "${PRODUTO}"
    Wait Until Element is Visible   ${SEARCH}
    Input Text                      ${SEARCH}       t-shirt
    Click Element                   ${BOTAO_PESQUISAR}

E adicione "${PRODUTO}" ao carrinho
    Wait Until Page Contains Element        xpath://*[contains(text(),"T-shirts")]
    Click Element                           xpath://*[contains(text(), "Add to cart")]

Quando for exibido produto "${PRODUTO}" no carrinho
    Wait Until Element is Visible       ${CONFIRMAR_ADD_PROD}
    Click Element                       xpath://*[contains(text(), "Proceed to checkout")]      #Confirmar e ir para tela de Checkoout

Entao devo ir para a tela de checkout
    Wait Until Page Contains Element        ${DIV_CHECKOUT}

    
    ## CENÁRIO 05 - REMOVER PRODUTO DO CARRINHO 
Dado que eu adicione um produto ao carrinho
                                            #Neste passo simplifiquei o ato de cadastrar o produto novamente, 
    base.Adicionar produtos     t-shirt     # já que ainda não estamos trabalhando com a manutenção do estado 
                                            # e persistência da massa de dados do teste.

    Wait Until Page Contains Element        ${DIV_CARRINHO}     #Aguardando aparecer o ícone de 'carrinho' no canto superior direito
    Click Element                           xpath://*[contains(text(), "Cart")]      #Ir pra tela do carrinho de compras

Quando desistir da compra e remover o produto
    Wait Until Element is Visible           ${TABELA_PRODUTOS}  #Aguardando a exibição da tabela de produtos
    Click Element                           ${BOTAO_REMOVER_PRODUTO}    #Clicar no botão de remover produto

Entao deve retornar a mensagem informando que o carrinho esta vazio
    Wait Until Element Contains             ${DIV_ALERT}     ${MSG_CARRINHO_VAZIO}

## CENÁRIO 06 - CRIANDO NOVO USUÁRIO

# Acessar pagina de Login
Dado que solicite fazer login no sistema
    Wait Until Page Contains Element        ${BOTAO_SIGN_IN}
Quando clicar no botao signIn
    Click Element                           ${BOTAO_SIGN_IN}
E for redirecionado para a pagina de login
    Wait Until Page Contains Element             ${FORMULARIO_CADASTRO}

E informar o email "${EMAIL}"
    Set Test Variable                       ${EMAIL}
    
    Wait Until Page Contains Element        ${CAMPO_EMAIL}
    Input Text                              ${CAMPO_EMAIL}      ${EMAIL}

Quando clicar para criar usuario
    Click Element                           ${BOTAO_CRIAR}
E for redirecionado para a pagina de cadastro   
    Wait Until Page Contains Element        ${FORMULARIO_CADASTRO_USUARIO}

# Cadastrar novo usuario
Quando preencher todos os campos obrigatorios
    Wait Until Element is Visible   ${NOME}
    Input Text                      ${NOME}         ${CLIENTE.nome}
    Input Text                      ${SOBRENOME}    ${CLIENTE.sobrenome}
    Click Element                   ${CONFIRMAR_CAMPO_EMAIL}
    ## Element Text Should Be          ${CONFIRMAR_CAMPO_EMAIL}    emailvalido@sasaassd.com
    Input Password                  ${SENHA}    123456

    Click Element                   ${PRIM_NOME}             
    Click Element                   ${SEGUNDO_NOME}         
    Input Text                      ${ENDERECO}         ${CLIENTE.endereco}
    Input Text                      ${CIDADE}           ${CLIENTE.cidade}
    Select From List By Value       ${ESTADO}           ${CLIENTE.estado}
    Input Text                      ${COD_POSTAL}       ${CLIENTE.CEP}
    Select From List By Value       ${PAIS}             ${CLIENTE.pais}
    Input Text                      ${CELULAR}          ${CLIENTE.telefone}
    Input Text                      ${ALIAS_ENDERECO}   ${CLIENTE.alias}
    Click Element                   ${BOTAO_REGISTRAR}

Entao usuario deve ser cadastrado com sucesso
    Wait Until Page Contains Element    ${CONTA_CHECK}

