*** Settings ***
Documentation       Documentação de API: https://fakerestapi.azurewebsites.net/index.html

Library             RequestsLibrary
Library             Collections


*** Variables ***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1
&{BOOK_15}      id=15
...             title=Book 15
...             pageCount=1500

&{BOOK_2022}  id=2022  
...  title=teste  
...  description=teste 
...  pageCount=2000  
...  excerpt=string
...  publishDate=2019-08-29T15:29:28.804Z

&{BOOK_150}  id=150  
...  title=teste  
...  description=teste 
...  pageCount=2000  
...  excerpt=teste
...  publishDate=2019-08-29T15:29:28.804Z

*** Keywords ***
####SETUP E TEARDOWNS
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}

#### AÇÕES

Requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    Books
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get Request    fakeAPI    Books/${ID_LIVRO}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar um novo livro
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    POST On Session          fakeAPI       Books 
    ...              data={"id": 2022,"title": "teste","description": "teste","pageCount": 2000,"excerpt": "string","publishDate": "2019-08-29T15:29:28.804Z"}  
    ...              headers=${HEADERS}
    ...              expected_status=200
...                  msg=Success
    Log                  ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Alterar um livro
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    PUT On Session          fakeAPI       Books/150
    ...              data={"id": 150,"title": "teste","description": "teste","pageCount": 2000,"excerpt": "teste","publishDate": "2019-08-29T15:29:28.804Z"}
    ...              headers=${HEADERS}
...                  msg=Success
    Log                  ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}


Deletar um Livro
    ${headers}    Create Dictionary    content-type=application/json
    ${response}    DELETE On Session   fakeAPI   Books/200
    ...              headers=${headers}
    ...              expected_status=200
    ...              msg=Success
    Log To Console                 ${RESPOSTA.text}
    

### CONFERENCIA

Conferir o Status Code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Status Should Be    200
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Status Should Be    200    msg= OK
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista de ${QTDE_LIVROS} livros
    Length Should Be    ${RESPOSTA.json()}    ${QTDE_LIVROS}

Conferir todos os dados do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id    ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title    ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount    ${BOOK_15.pageCount}
    Should Not Be Empty    ${RESPOSTA.json()["description"]}
    Should Not Be Empty    ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados cadastrados para o novo livro
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id    ${BOOK_2022.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title    ${BOOK_2022.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${BOOK_2022.description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount    ${BOOK_2022.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt    ${BOOK_2022.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate    ${BOOK_2022.publishDate}

Conferir se retorna todos os dados alterados do livro 150
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id    ${BOOK_150.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title    ${BOOK_150.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${BOOK_150.description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount    ${BOOK_150.pageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt    ${BOOK_150.excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate    ${BOOK_150.publishDate}

Conferir se deleta o livro ${ID_LIVRO}
    Requisitar o livro "${ID_LIVRO}"
    Should Be Empty    ${RESPOSTA.content}

    