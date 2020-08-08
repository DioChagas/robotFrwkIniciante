*** Settings ***
Documentation       Aqui estão presentes todos (ou alguns) elementos mapeados

*** Variables ***

## CENÁRIO 01 - Realizar pesquisa

${SEARCH}                       id:search_query_top
${BOTAO_PESQUISAR}              css:button[type=submit]
${DIV_ALERT}                    class:alert

## CENÁRIO 02 - Validar msg de produto não encontrado
${MSG_PRODUTO_INEXISTENTE}      No results were found for your search "produtoInexistente"

## CENÁRIO 04
${CONFIRMAR_ADD_PROD}           class:icon-ok
${DIV_CHECKOUT}                 id:cart_title