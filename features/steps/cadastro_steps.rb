Dado("que eu esteja na tela de cadastro") do
  report_screenshot
  login_page.link_cadastro.click
end

E("preencha os dados para cadastro") do
  name = (Faker::TvShows::RickAndMorty.character).gsub("'","")
  login_page.input_email.send_keys "#{name}_#{Faker::Internet.email}".gsub(' ', '.')
  login_page.input_senha.send_keys user1[:senha]
  cadastro_page.input_nome.send_keys name
end

E("preencha os dados para cadastro um usuario ja cadastrado") do
  login_page.input_email.send_keys user1[:email]
  login_page.input_senha.send_keys user1[:senha]
  cadastro_page.input_nome.send_keys user1[:nome]
end

Quando("eu clicar no botao cadastrar") do
  cadastro_page.btn_cadastrar.click
end

Entao("visualizo a mensagem de sucesso {string} na tela") do |mensagem|
  expect(home_page.txt_alert_success.text).to eq(mensagem)
end

Entao("visualizo as mensagens de erro de informacão faltando") do
  errors = ['Nome é um campo obrigatório', 'Email é um campo obrigatório', 'Senha é um campo obrigatório']
  cadastro_page.txt_alerts_erro.each { |alert| expect(errors.include?(alert.text)).to be_truthy }
end
