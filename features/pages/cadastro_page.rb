class CadastroPage < SitePrism::Page

    element :input_nome, :xpath, "//input[@id = 'nome']"
    element :btn_cadastrar, :xpath, "//input[@value = 'Cadastrar']"

end