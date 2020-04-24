#language: pt

@web @movimentacao
Funcionalidade: Movimentação

    @positivo @adicionar
    Cenario: criar movimentação com sucesso
        Dado que vou para pagina clicando em "Criar Movimentação"
        E preenco os dados da movimentacao corretamente
        Quando eu clicar no botao entrar
        Entao visualizo a mensagem de sucesso "Movimentação adicionada com sucesso!" na tela

    @positivo @remover
    Cenario: Remover movimentação
        Dado que vou para pagina clicando em "Resumo Mensal"
        E vejo as movimentacoes que tem
        Quando clico em remover movimentacao
        Entao visualizo a mensagem de sucesso "Movimentação removida com sucesso!" na tela