Before '@web' do 
    @helper = Helper.new
    visit("https://srbarriga.herokuapp.com/login")
end

Before '@vetor_contas' do
    @helper = Helper.new
    home_page = HomePage.new
    resumo_mensal_page = ResumoMensalPage.new
    $vet_contas_com_movimentacao = []
    visit("https://srbarriga.herokuapp.com/login")
    @helper.fazer_login
    $vet_contas_com_movimentacao = @helper.vetor_de_texto_lista(home_page.list_contas, $vet_contas_com_movimentacao)
    @helper.selecionar_na_lista('Resumo Mensal',home_page.menu)
    $vet_contas_com_movimentacao = @helper.vetor_de_texto_lista(resumo_mensal_page.list_contas_com_movimentacao, $vet_contas_com_movimentacao)
    @helper.selecionar_na_lista('Sair',home_page.menu)
end

After do |scenario|
    @nome = scenario.name.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
    @helper.take_screenshot(@nome, 'screenshots/test_failed') if   scenario.failed?
    unless @helper.take_screenshot(@nome, 'screenshots/test_passed')
    end
   @browser.cookies.clear rescue warn 'Sem sessão para limpar'
   puts "O cenário terminou em: #{DateTime.now.strftime("%H:%M(%Z) - %d/%m/%Y")}"
end

AfterStep do
    @helper.screen 'image.png'
    embed("image.png", 'image/png')
end

at_exit do
    #$driver.driver_quit
  ReportBuilder.input_path = "cucumber.json"
  ReportBuilder.configure do |config|
     config.report_path = "reports/run"
     config.report_types = [:json, :html]
   options = {
     report_title: "#{DateTime.now.strftime("%H:%M(%Z) - %d/%m/%Y")}"
   }
  ReportBuilder.build_report options
  end
end

After do |scenario|
    if scenario.failed?
       @helper.screen 'image.png'
       embed("image.png", 'image/png')
    end
  end