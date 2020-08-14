Dado("que vou para pagina clicando em {string}") do |menu|
  fazer_login
  selecionar_na_lista(menu, home_page.menu)
end

Dado("preenco os dados da movimentacao corretamente") do
  selecionar_na_lista(movimentacao_page.comb_box_tipo[rand(movimentacao_page.comb_box_tipo.size)].text, movimentacao_page.comb_box_tipo)
  selecionar_na_lista(movimentacao_page.comb_box_contas[rand(movimentacao_page.comb_box_contas.size)].text, movimentacao_page.comb_box_contas)
  movimentacao_page.input_data_pagamento.send_keys Date.today.strftime("%d/%m/%Y")
  movimentacao_page.input_data_transacao.send_keys Faker::Date.between(from: Date.new(2000, 1, 1), to: Date.today).strftime("%d/%m/%Y")
  movimentacao_page.input_descricao.send_keys Faker::DcComics.title
  movimentacao_page.input_valor.send_keys Faker::Number.decimal(l_digits: 3, r_digits: 2)
  movimentacao_page.input_interessado.send_keys Faker::Name.name
  movimentacao_page.radio_pendente_pago[rand(movimentacao_page.radio_pendente_pago.size)].click
end

E("vejo as movimentacoes que tem") do
  time = Time.now
  anterior = time - 2592000
  selecionar_na_lista(mes_brasil(anterior.strftime("%m")), resumo_mensal_page.list_mes)
  selecionar_na_lista(anterior.strftime("%Y"), resumo_mensal_page.list_ano)
  resumo_mensal_page.btn_buscar.click
  if resumo_mensal_page.list_remover_movimentacao.empty?
    selecionar_na_lista(mes_brasil(time.strftime("%m")), resumo_mensal_page.list_mes)
    selecionar_na_lista(time.strftime("%Y"), resumo_mensal_page.list_ano)
    resumo_mensal_page.btn_buscar.click
  end
end

Quando("clico em remover movimentacao") do
  resumo_mensal_page.list_remover_movimentacao[rand(resumo_mensal_page.list_remover_movimentacao.size)].click
end