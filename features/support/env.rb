require 'cucumber'
require 'selenium/webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'faker'
require 'cpf_faker'
require 'report_builder'
require 'rspec'
require 'capybara/rspec'

BROWSER = ENV['BROWSER'] #definicao do browser

FileUtils.mkdir_p('report/others') unless File.exist?('report/others')

Dir["#{File.expand_path('', __dir__)}/methods_helper/*_helper.rb"].map { |file| require_relative file }

Dir["#{File.expand_path('', __dir__)}/page_helper/*page_helper.rb"].map { |file| require_relative file }

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
end
COMECOU = DateTime.now.strftime('%d/%m/%Y - %H:%M:%S(%Z)')
puts "Rodando no Browser #{BROWSER} os testes começaram em: #{COMECOU}"

Capybara.default_driver = :selenium

Capybara.default_max_wait_time = 60 #tempo limite de execução
Capybara.app_host = 'https://srbarriga.herokuapp.com/login' #endereço da página a ser testada

World(PageObjects)
