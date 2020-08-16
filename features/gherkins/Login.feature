#language: pt

@login @web
Funcionalidade: Login

  Eu como Cliente
  Quero poder entrar no site
  Para que eu possa utiliza-lo

  @positivo
  Cenario: login com sucesso
    Dado que eu digite um usuario e senha valida
    Quando eu clicar no botao entrar
    Entao visualizo a mensagem login com sucesso

  @negativo
  Cenario: login faltando email
    Dado que eu nao preencha o campo email
    Quando eu clicar no botao entrar
    Entao visualizo a mensagem de erro "Email é um campo obrigatório" na tela

  @negativo
  Cenario: login sem senha
    Dado que eu nao preencha o campo senha
    Quando eu clicar no botao entrar
    Entao visualizo a mensagem de erro "Senha é um campo obrigatório" na tela