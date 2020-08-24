def return_date(difence_days: 0, format: nil)
  return Time.now + (86400 * difence_days) if format.nil?

  (Time.now + (86400 * difence_days)).strftime(format)
end

def mes_brasil(mes)
  case mes
  when '01', '1'
    return 'Janeiro'
  when '02', '2'
    return 'Fevereiro'
  when '03', '3'
    return 'Março'
  when '04', '4'
    return 'Abril'
  when '05', '5'
    return 'Maio'
  when '06', '6'
    return 'Junho'
  when '07', '7'
    return 'Julho'
  when '08', '8'
    return 'Agosto'
  when '09', '9'
    return 'Setembro'
  when '10'
    return 'Outubro'
  when '11'
    return 'Novembro'
  when '12'
    return 'Dezembro'
  else
    raise 'Não existe esse mês'
  end
end

def selecionar_na_lista(opcao, lista)
  lista.each { |menu|
    if menu.text.upcase.include? opcao.upcase
      menu.click
      return true
    end
  }
  raise "Não existe a opção '#{opcao}' na lista"
end

def retorna_nome_diferente_vetor(lista, vetor)
  lista.each { |opcao|
    ver = true
    vetor.each { |nome|
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

def vetor_de_texto_lista(lista, vetor)
  lista.each { |opcao|
    unless vetor.include? opcao.text
      vetor.push opcao.text
    end
  }
  vetor
end

def list_includ?(opcao, lista)
  lista.each { |menu|
    if menu.text.upcase.include? opcao.upcase
      menu.click
      return true
    end
  }
  false
end
