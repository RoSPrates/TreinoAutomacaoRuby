Before '@web' do
  visit("https://srbarriga.herokuapp.com/login")
end

Before '@vetor_contas' do
  $vet_contas_com_movimentacao = []
  visit("https://srbarriga.herokuapp.com/login")
  fazer_login
  $vet_contas_com_movimentacao = vetor_de_texto_lista(home_page.list_contas, $vet_contas_com_movimentacao)
  selecionar_na_lista('Resumo Mensal', home_page.menu)
  $vet_contas_com_movimentacao = vetor_de_texto_lista(resumo_mensal_page.list_contas_com_movimentacao, $vet_contas_com_movimentacao)
  selecionar_na_lista('Sair', home_page.menu)
end

After do |scenario|
  @nome = scenario.name.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
  take_screenshot(@nome, 'screenshots/test_failed') if scenario.failed?
  unless take_screenshot(@nome, 'screenshots/test_passed')
  end
  @browser.cookies.clear rescue warn 'Sem sessão para limpar'
  puts "O cenário terminou em: #{DateTime.now.strftime('%H:%M(%Z) - %d/%m/%Y')}"
end

AfterStep do
  report_screenshot
end

at_exit do
  #$driver.driver_quit
  current_date = Time.now
  date = current_date.strftime('%d_%m_%Y')
  FileUtils.mkdir_p("report/#{date}") unless File.exist?("report/#{date}")
  name_report = "report/#{date}/report_web_#{current_date.strftime('%d-%m-%Y_%H-%M-%S')}"

  ReportBuilder.input_path = "cucumber.json"

  ReportBuilder.configure do |config|
    config.report_path = name_report
    config.report_types = [:html]
    config.color = 'indigo'
    config.additional_info = { browser: 'Chrome', Framework_By: 'Rodrigo Prates' }
  end

  options = {
    report_title: "Ruby Frame Web Report\n#{DateTime.now.strftime('%H:%M(%Z) - %d/%m/%Y')}"
  }
  ReportBuilder.build_report options
end

After do |scenario|
  if scenario.failed?
    report_screenshot
  end
end
