home_page = HomePage.new
login_page = LoginPage.new
cadastro_page = CadastroPage.new

Dado("que eu esteja na tela de cadastro") do
  login_page.link_cadastro.click
end

E("preencha os dados para cadastro") do
    login_page.input_email.send_keys Faker::Internet.email
    login_page.input_senha.send_keys Utils.class_variable_get(:@@senha)
    cadastro_page.input_nome.send_keys Faker::Name.name
end

Quando("eu clicar no botao cadastrar") do
  cadastro_page.btn_cadastrar.click
end

Entao("visualizo a mensagem de sucesso {string} na tela") do |mensagem|
    expect(home_page.txt_login_sucesso.text).to eq(mensagem)
end

E("preencha os dados para cadastro um usuario ja cadastrado") do
  login_page.input_email.send_keys Utils.class_variable_get(:@@email)
  login_page.input_senha.send_keys Utils.class_variable_get(:@@senha)
  cadastro_page.input_nome.send_keys Utils.class_variable_get(:@@nome)
end