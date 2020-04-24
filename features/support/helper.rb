class Helper

  def take_screenshot(name_file, folder =     'screenshots/test_screens')
      file = "#{folder}/#{name_file}.png"
      FileUtils.mkdir_p(folder) unless File.exist?(folder)
      Capybara.page.driver.browser.save_screenshot(file)
  end

  def screen (name_file)
      file = name_file
      Capybara.page.driver.browser.save_screenshot(file)
  end

  def selecionar_na_lista(opcao, lista)
      lista.each{|menu| 
          if menu.text.upcase.include? opcao.upcase 
          menu.click
          return true
          end
      }
  raise "Não existe a opção '"+ opcao +"' na lista"
  end

  def verificar_se_tem_na_lista(opcao, lista)
    lista.each{
        |menu| 
        if menu.text.upcase.include? opcao.upcase 
        menu.click
        return true
        end
    }
    return false
  end

  def fazer_login
    login = LoginPage.new
    login.input_email.send_keys Utils.class_variable_get(:@@email)
    login.input_senha.send_keys Utils.class_variable_get(:@@senha)
    login.btn_entrar.click
  end

  def vetor_de_texto_lista(lista,vetor)
    lista.each {
      |opcao|
      unless vetor.include? opcao.text
        vetor.push opcao.text
      end
    }
    return vetor
  end

  def retorna_nome_diferente_vetor(lista,vetor)
    lista.each{
      |opcao|
      ver = true
      vetor.each{
        |nome|
        if opcao.text.upcase.include? nome.upcase
          ver = false
          break
        end
      }
      if ver
       return opcao
      end
    }
  end

  def mes_brasil(mes)
    case mes
    when '01','1'
      return 'Janeiro'
    when '02','2'
      return 'Fevereiro'
    when '03','3'
      return 'Março'
    when '04','4'
      return 'Abril'
    when '05','5'
      return 'Maio'
    when '06','6'
      return 'Junho'
    when '07','7'
      return 'Julho'
    when '08','8'
      return 'Agosto'
    when '09','9'
      return 'Setembro'
    when '10'
      return 'Outubro'
    when '11'
      return 'Novembro'
    when '12'
      return 'Dezembro'
    end
    raise "Não existe esse mês"
  end

end