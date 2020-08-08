*** Settings ***
Documentation       Aqui ficarão as palavras-chaves

Resource            elements.robot
Resource            base.robot

*** Keywords ***
##CENÁRIO 01
Dado que eu digite "${PRODUTO}" no campo de pesquisa
    Wait Until Element is Visible       ${SEARCH}
    Input Text                          ${SEARCH}       Dresses     
Quando clicar no botao pesquisar
    Click Element              ${BOTAO_PESQUISAR}

Entao deve listar o produto "${PRODUTO}" 
    Wait Until Page Contains Element            xpath://*[@id="center_column"]/h1/span[contains(text(),"Dresses")]




##CENÁRIO 03
Dado que eu acesse a categoria "${CATEGORIA}"
    Wait Until Element Is Visible           xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Mouse Over                              xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

E em seguida a subcategoria "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]
    Click Element                           xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]

Entao devo ir para página "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="center_column"]/h1/span[contains(text(),"Summer Dresses")]