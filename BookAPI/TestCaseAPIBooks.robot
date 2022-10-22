*** Settings ***
Documentation       Documentação de API: https://fakerestapi.azurewebsites.net/index.html

Resource            ResourceAPI.robot

Suite Setup         Conectar a minha API


*** Test Cases ***
Buscar listagem dos livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o Status Code    200
    Conferir o reason    OK
    Conferir se retorna uma lista de 200 livros

Buscar livro expecifico (GET em um livro expecifico)
    Requisitar o livro "15"
    Conferir o Status Code    200
    Conferir o reason    OK
    Conferir todos os dados do livro 15

Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir se retorna todos os dados cadastrados para o novo livro

Alterar um livro (PUT)
    Alterar um livro
    Conferir se retorna todos os dados alterados do livro 150

Deletar um livro (DELETE)
    Conferir se deleta o livro 200