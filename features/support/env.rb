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

require_relative '..\support\helper.rb'

Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox) #definição do browser
    end
    
    Capybara.default_driver = :selenium
    
    Capybara.default_max_wait_time = 60 #tempo limite de execução
    Capybara.app_host = "https://srbarriga.herokuapp.com/login" #endereço da página a ser testada