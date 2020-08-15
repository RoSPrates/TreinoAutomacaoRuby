def fazer_login
  login_page.input_email.send_keys user1[:email]
  login_page.input_senha.send_keys user1[:senha]
  login_page.btn_entrar.click
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
  end
  raise 'Não existe esse mês'
end
