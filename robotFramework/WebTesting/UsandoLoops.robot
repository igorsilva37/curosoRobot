*** Settings ***
Documentation       Vamos aprender a fazer LOOPS usando o Robot Framework!!


*** Variables ***
### Indíce da lista    0    1    2    3    4    5    6
@{MINHA_LISTA_DE_FRUTAS}    maça    abacaxi    banana    morango    laranja    uva    melancia

@{MINHA_LISTA_DE_NUMEROS}       0    1    2    3    4    5    6    7    8    9    10    11

*** Test Cases ***
Teste de REPEAT KEYWORD
    [Documentation]    Chama uma mesma keyword várias vezes
    Usando Repeat keyword

Teste de FOR do tipo IN RANGE
    [Documentation]    Faz um loop dentro de um intervalo que você passar
    Usando FOR IN RANGE

Teste de FOR do tipo IN
    [Documentation]    Faz um loop percorrendo a lista que você passar
    Usando FOR IN

Teste de FOR do tipo IN ENUMERATE
    [Documentation]    Faz um loop percorrendo a lista que você passar e percorre o indíce da lista
    Usando FOR IN ENUMERATE

Teste de Sair do FOR
    [Documentation]    Você controla quando o FOR deve se encerrar antes de terminar todos os LOOPS
    Usando FOR IN com EXIT FOR LOOP IF

Teste imprimir numeros especificos
    [Documentation]    Imprimir numeros especificos da tabela de numeros
    Usando FOR com IF e Else


*** Keywords ***
Usando Repeat keyword
    Log To Console    ${\n}
    Repeat Keyword    4x    Log To Console    Minha repetição da keyword!!!

Usando For IN RANGE
    Log To Console    ${\n}
    FOR    ${CONTADOR}    IN RANGE    0    5
        Log To Console    Minha posição agora é: ${CONTADOR}
        Log    Minha posição agora e: ${CONTADOR}
    END

Usando FOR IN
    Log To Console    ${\n}
    FOR    ${FRUTA}    IN    @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${FRUTA}
        No Operation
    END

Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR    ${INDICE}    ${FRUTA}    IN ENUMERATE    @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}!
        No Operation
    END

Usando FOR IN com EXIT FOR LOOP IF
    Log To Console    ${\n}
    FOR    ${INDICE}    ${FRUTA}    IN ENUMERATE    @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}!
        IF    '${FRUTA}'=='laranja'    BREAK
    END

Usando FOR com IF e Else
    Log To Console    ${\n}
    FOR    ${numero}    IN   @{MINHA_LISTA_DE_NUMEROS}
        IF  ${numero} == 5
            Log To Console    Eu sou o número 5!
        ELSE IF  ${numero} == 10
            Log To Console    Eu sou o número 10!
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10!
        END
    END

    Log To Console    ${\n}
