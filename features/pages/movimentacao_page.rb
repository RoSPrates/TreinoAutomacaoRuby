module Movimentacao
  class MovimentacaoPage < SitePrism::Page

    elements :comb_box_contas, :xpath, "//select[@id = 'conta']/option"
    elements :comb_box_tipo, :xpath, "//select[@id = 'tipo']/option"
    element :input_data_transacao, :xpath, "//input[@id = 'data_transacao']"
    element :input_data_pagamento, :xpath, "//input[@id = 'data_pagamento']"
    element :input_descricao, :xpath, "//input[@id = 'descricao']"
    element :input_valor, :xpath, "//input[@id = 'valor']"
    element :input_interessado, :xpath, "//input[@id = 'interessado']"
    elements :list_erros, :xpath, "//div[@class = 'alert alert-danger']/descendant::li"
    elements :radio_pendente_pago, :xpath, "//input[contains(@id,'status')]"

  end
end
