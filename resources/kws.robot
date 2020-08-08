*** Settings ***
Documentation       Aqui ficarão as palavras-chaves


*** Keywords ***
##CENÁRIO 01





##CENÁRIO 03
Dado que eu acesse a página da moda mudelo
    Go To           ${base_url}

Acesse a categoria "${CATEGORIA}"
    Wait Until Element Is Visible           xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Mouse Over                              xpath://*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

E em seguida a subcategoria "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]
    Click Element                           xpath://*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]

Entao devo ir para página "${SUBCATEGORIA}"
    Wait Until Page Contains Element        xpath://*[@id="center_column"]/h1/span[contains(text(),"Summer Dresses")]