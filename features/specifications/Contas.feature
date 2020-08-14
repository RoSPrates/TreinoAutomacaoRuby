#language: pt

@web @contas
Funcionalidade: Contas

  @positivo @adicionar
  Cenario: Adicionar conta
    Dado que vou para pagina clicando em "Contas" e "Adicionar"
    E preencho o nome
    Quando eu clicar no botao entrar
    Entao visualizo a mensagem de sucesso "Conta adicionada com sucesso!" na tela

  @positivo @remover @vetor_contas
  Cenario: Remover conta
    Dado que vou para pagina clicando em "Contas" e "Listar"
    Quando clico em remover conta
    Entao visualizo a mensagem de sucesso "Conta removida com sucesso!" na tela

  @positivo @editar
  Cenario: Editar conta
    Dado que vou para pagina clicando em "Contas" e "Listar"
    E clico em editar conta
    E preencho o nome
    Quando eu clicar no botao entrar
    Entao visualizo a mensagem de sucesso "Conta alterada com sucesso!" na tela

  @negativo @editar
  Cenario: Editar conta sem colocar um nome
    Dado que vou para pagina clicando em "Contas" e "Listar"
    E clico em editar conta
    Quando clico em entrar sem preencher o nome
    Entao visualizo a mensagem de erro "Informe o nome da conta" na tela

  @negativo @editar
  Cenario: Editar conta com um nome ja exitente
    Dado que vou para pagina clicando em "Contas" e "Listar"
    E eu clicar em editar
    E preenco o comapo com um nome existente
    Quando eu clicar no botao entrar
    Entao visualizo a mensagem de erro "Já existe uma conta com esse nome!" na tela

  @negativo @adicionar @vetor_contas @test
  Cenario: Adicionar uma conta com um nome existente
    Dado que vou para pagina clicando em "Contas" e "Adicionar"
    E preencho o compo com uma conta existente
    Quando eu clicar no botao entrar
    Entao visualizo a mensagem de erro "Já existe uma conta com esse nome!" na tela