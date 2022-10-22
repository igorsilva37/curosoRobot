*** Settings ***
Documentation       Essa suite teste o site da amazon.com.br

Resource            amazon_resources.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônico"
    [Documentation]    O teste verifica o menu Eletrônicos do site amazon.com.br
    ...    e verifica a categoria computadores informatica
    [Tags]    menus
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Tablets"

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]    O teste acessa o site da amazon.com.br e executa a pesquisa
    ...    e veriica de o site retorna o produto pesquisado
    [Tags]    busca_produtos lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]    adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Selecionar o produto"Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar mensagem de confirmação "Adicionado ao carrinho"
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]    remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Selecionar o produto"Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar mensagem de confirmação "Adicionado ao carrinho"
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio
