module Login
  class LoginPage < SitePrism::Page

    element :input_email, :xpath, "//input[@id = 'email']"
    element :input_senha, :xpath, "//input[@id = 'senha']"
    element :btn_entrar, :xpath, "//button[@class = 'btn btn-primary']"
    element :txt_erro, :xpath, "//div[@class = 'alert alert-danger']"
    element :link_cadastro, :xpath, "//a[@href = '/cadastro']"

    def fazer_login
      input_email.send_keys user1[:email]
      input_senha.send_keys user1[:senha]
      btn_entrar.click
    end
  end
end
