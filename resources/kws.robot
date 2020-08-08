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

##CENÁRIO 02 - Buscar Produto INexistente
Dado que eu digite "${PRODUTO}"
    Wait Until Element is Visible       ${SEARCH}
    Input Text                          ${SEARCH}       produtoInexistente

Quando pesquisar
    Click Element               ${BOTAO_PESQUISAR}

Entao deve retornar a mensagem de erro
    Wait Until Element Contains     ${DIV_ALERT}     No results were found for your search "produtoInexistente"

##CENÁRIO 03
Dado que eu acesse a categoria "${CATEGORIA}"
    Wait Until Element Is Visible           xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Mouse Over                              xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

E em seguida a subcategoria "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]
    Click Element                           xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]

Entao devo ir para página "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="center_column"]/h1/span[contains(text(),"Summer Dresses")]