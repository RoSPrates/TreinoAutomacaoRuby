home_page = HomePage.new
cadastro_page = CadastroPage.new
helper = Helper.new
contas_page = ContasPage.new
login_page = LoginPage.new

Dado("que vou para pagina clicando em {string} e {string}") do |menu, sub_menu|
  helper.fazer_login
  helper.selecionar_na_lista(menu, home_page.menu)
  helper.selecionar_na_lista(sub_menu, home_page.menu)
end
  
Dado("preencho o nome") do
  cadastro_page.input_nome.native.clear
  cadastro_page.input_nome.send_keys Faker::Games::Pokemon.name + " "+ Faker::Games::Zelda.character 
end

Quando("clico em remover conta") do
  contas_page.clicar_remover helper.retorna_nome_diferente_vetor(contas_page.lst_contas, $vet_contas_com_movimentacao).text
end

E("clico em editar conta") do
  contas_page.clicar_editar contas_page.lst_contas[2].text
end

Quando("clico em entrar sem preencher o nome") do
  cadastro_page.input_nome.native.clear
  login_page.btn_entrar.click
end

E("eu clicar em editar") do
  @nome_conta = contas_page.lst_contas[1].text
  contas_page.clicar_editar contas_page.lst_contas[3].text
end

E("preenco o comapo com um nome existente") do
  cadastro_page.input_nome.native.clear
  cadastro_page.input_nome.send_keys @nome_conta
end

Dado("preencho o compo com uma conta existente") do
  cadastro_page.input_nome.native.clear
  cadastro_page.input_nome.send_keys $vet_contas_com_movimentacao[rand($vet_contas_com_movimentacao.size)]
end