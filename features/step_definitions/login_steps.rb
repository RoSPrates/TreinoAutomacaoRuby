Dado("que eu digite um usuario e senha valida") do
  report_screenshot
  login_page.input_email.send_keys user1[:email]
  login_page.input_senha.send_keys user1[:senha]
end

Dado("que eu nao preencha o campo email") do
  report_screenshot
  login_page.input_senha.send_keys user1[:senha]
end

Dado("que eu nao preencha o campo senha") do
  report_screenshot
  login_page.input_email.send_keys user1[:email]
end

Quando("eu clicar no botao entrar") do
  login_page.btn_entrar.click
end

Entao("visualizo a mensagem login com sucesso") do
  expect(home_page.txt_login_sucesso.text).to eq("Bem vindo, #{user1[:nome]}!")
end

Entao("visualizo a mensagem de erro {string} na tela") do |mensagem|
  expect(login_page.txt_erro.text).to eq(mensagem)
end
