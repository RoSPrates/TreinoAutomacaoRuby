#language: pt

@cadastro @web
Funcionalidade: Cadastro de usuarios

  @positivo
  Cenario: cadastro de usuarios com sucesso
    Dado que eu esteja na tela de cadastro
    E preencha os dados para cadastro
    Quando eu clicar no botao cadastrar
    Entao visualizo a mensagem de sucesso "Usuário inserido com sucesso" na tela

  @negativo
  Cenario: cadastro de usuario ja acadastrado
    Dado que eu esteja na tela de cadastro
    E preencha os dados para cadastro um usuario ja cadastrado
    Quando eu clicar no botao cadastrar
    Entao visualizo a mensagem de erro "Endereço de email já utilizado" na tela