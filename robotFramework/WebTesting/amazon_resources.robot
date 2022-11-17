*** Settings ***
Library     SeleniumLibrary
Library     ScreenCapLibrary


*** Variables ***
${BROWSER}                  CHROME
${URL}                      http://www.amazon.com.br
${MENU_ELETRONICOS}
...                         //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}       //div[@class="a-container"]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    Start Gif Recording

Fechar o navegador
    Capture Page Screenshot
    Stop Gif Recording
    Close Browser

 Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Wait Until Page Contains    text=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    [Tags]    busca_produtos lista_busca
    Element Should Be Visible    locator=//a[@aria-label="Computadores e Informática"]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

Selecionar o produto"${PRODUTO}"
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]

Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Element Is Visible    locator=//input[contains(@name,'submit.add-to-cart')]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Verificar mensagem de confirmação "${MSG_CONFIRMAÇÃO}"
    Wait Until Page Contains    text=${MSG_CONFIRMAÇÃO}
    Wait Until Element Is Visible    locator=//span[contains(.,'${MSG_CONFIRMAÇÃO}')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//img[@height='152']

Remover o produto "${PRODUTO}" do carrinho
    Click Element    locator=//a[contains(@aria-label,'1 item no carrinho')]
    Wait Until Element Is Visible    locator=(//span[@class="a-truncate-full a-offscreen"])[1]
    Click Element    locator=//input[@value='Excluir']

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

#BDD - GHERKIN

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Selecionar o produto"Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar mensagem de confirmação "Adicionado ao carrinho"
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
