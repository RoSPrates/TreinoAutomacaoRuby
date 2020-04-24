login_page = LoginPage.new
home_page = HomePage.new

Dado("que eu digite um usuario e senha valida") do
    login_page.input_email.send_keys Utils.class_variable_get(:@@email)
    login_page.input_senha.send_keys Utils.class_variable_get(:@@senha)
end

Dado("que eu nao preencha o campo email") do
    login_page.input_senha.send_keys Utils.class_variable_get(:@@senha)
end

Dado("que eu nao preencha o campo senha") do
    login_page.input_email.send_keys Utils.class_variable_get(:@@email)
  end

Quando("eu clicar no botao entrar") do
    login_page.btn_entrar.click
end

Entao("visualizo a mensagem login com sucesso") do
    expect(home_page.txt_login_sucesso.text).to eq("Bem vindo, #{Utils.class_variable_get(:@@nome)}!")
end

Entao("visualizo a mensagem de erro {string} na tela") do |mensagem|
    expect(login_page.txt_erro.text).to eq(mensagem)
end
