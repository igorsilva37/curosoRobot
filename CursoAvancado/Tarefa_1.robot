*** Settings ***
Library     OperatingSystem
Library     DiffLibrary


*** Test Cases ***
Tarefa: Estude a library DiffLibrary e faça um teste utilizando ela
    [Tags]    diff
    Usando o diff


*** Keywords ***
Usando o diff
    Create File    ./my_files/arquivo_Diff1.txt    Teste utilizando Diff Library
    Create File    ./my_files/arquivo_Diff2.txt    Teste utilizando Diff Library diferente
    ${diff1} =    Get File    ./my_files/arquivo_Diff1.txt
    ${diff2} =    Get File    ./my_files/arquivo_Diff2.txt
    Diff Files    ${diff1}    ${diff2}    fail=false
