*** Settings ***
Documentation       Exemplo de uso de variáveis como argumentos em Keywords

Library             String


*** Variables ***
&{PESSOA}       nome=Igor    sobrenome=Alves


*** Test Cases ***
Imprimir email aleatorio
    ${EMAIL}    Criar email aleatorio    ${PESSOA.nome}    ${PESSOA.sobrenome}
    Log To Console    ${EMAIL}


*** Keywords ***
Criar email aleatorio
    [Arguments]    ${NOME}    ${SOBRENOME}
    ${PALAVRA_ALEATORIA}    Generate Random String
    ${ATIVIDADE_CONCLUIDA}    Set Variable    ${NOME}${SOBRENOME}${PALAVRA_ALEATORIA}@teste.com
    RETURN    ${ATIVIDADE_CONCLUIDA}
