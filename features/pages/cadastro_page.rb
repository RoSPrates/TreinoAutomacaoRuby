module Cadastro
  class CadastroPage < SitePrism::Page

    element :input_nome, :xpath, "//input[@id = 'nome']"
    element :btn_cadastrar, :xpath, "//input[@value = 'Cadastrar']"
    elements :txt_alerts_erro, :xpath, "//div[@class = 'alert alert-danger']"

  end
end
