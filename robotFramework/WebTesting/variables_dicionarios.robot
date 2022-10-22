*** Settings ***
Documentation       Exemplo de escopo de variáveis: GLOBAIS, SUITE, TESTE (test case) e LOCAL (keyword)

Library             String


*** Variables ***
@{MESES_DIAS}       data_inicia=31 DIAS    fevereiro=28 DIAS    março=31 DIAS   abril=30 DIAS    maio=31 DIAS    junho=30 DIAS
...                 julho=31 DIAS    agosto=31 DIAS   setembro=30 DIAS   outubro=31 DIAS   novembro=30 DIAS   dezembro=31 DIAS


*** Test Cases ***
Imprimir os meses do ano
    Log To Console    Mês 01: ${MESES_DIAS[0]}
    Log To Console    Mês 02: ${MESES_DIAS[1]}
    Log To Console    Mês 03: ${MESES_DIAS[2]}
    Log To Console    Mês 04: ${MESES_DIAS[3]}
    Log To Console    Mês 05: ${MESES_DIAS[4]}
    Log To Console    Mês 06: ${MESES_DIAS[5]}
    Log To Console    Mês 07: ${MESES_DIAS[6]}
    Log To Console    Mês 08: ${MESES_DIAS[7]}
    Log To Console    Mês 09: ${MESES_DIAS[8]}
    Log To Console    Mês 10: ${MESES_DIAS[9]}
    Log To Console    Mês 11: ${MESES_DIAS[10]}
    Log To Console    Mês 12: ${MESES_DIAS[11]}
