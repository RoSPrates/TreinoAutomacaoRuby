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
  lista.each {
      |opcao|
    ver = true
    vetor.each {
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

def vetor_de_texto_lista(lista, vetor)
  lista.each {
      |opcao|
    unless vetor.include? opcao.text
      vetor.push opcao.text
    end
  }
  vetor
end

def list_includ?(opcao, lista)
  lista.each {
      |menu|
    if menu.text.upcase.include? opcao.upcase
      menu.click
      return true
    end
  }
  false
end