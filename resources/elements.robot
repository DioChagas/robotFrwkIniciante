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

## CENÁRIO 05
${DIV_CARRINHO}                 class:shopping_cart
${TABELA_PRODUTOS}              id:cart_summary
${BOTAO_REMOVER_PRODUTO}        class:icon-trash
${MSG_CARRINHO_VAZIO}           Your shopping cart is empty


##  CENÁRIO 06 
    ## PÁGINA LOGIN
${BOTAO_SIGN_IN}                class:login
${FORMULARIO_CADASTRO}          class:page-heading
${CAMPO_EMAIL}                  id:email_create
${BOTAO_CRIAR}                  id:SubmitCreate
    ## FORMULÁRIO
${FORMULARIO_CADASTRO_USUARIO}  id:noSlide
${NOME}                         id:customer_firstname
${SOBRENOME}                    id:customer_lastname
${CONFIRMAR_CAMPO_EMAIL}        id:email
${SENHA}                        id:passwd

${PRIM_NOME}                    id:firstname
${SEGUNDO_NOME}                 id:lastname
${ENDERECO}                     id:address1
${CIDADE}                                id:city
${ESTADO}                       id:id_state
${COD_POSTAL}                   id:postcode
${PAIS}                         id:id_country
${CELULAR}                      id:phone_mobile
${ALIAS_ENDERECO}               id:alias
${BOTAO_REGISTRAR}              id:submitAccount

${CONTA_CHECK}                  class:info-account