*** Settings ***
Documentation       Aqui ficarão as palavras-chaves

Resource            elements.robot
Resource            base.robot

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

##CENÁRIO 04 - Adicionando produtos no carrinho
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

Entao devo confirmar a compra e ir para a tela de checkout
    Wait Until Page Contains Element       ${DIV_CHECKOUT}