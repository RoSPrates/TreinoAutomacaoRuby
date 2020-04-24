class ResumoMensalPage < SitePrism::Page

   elements :list_contas_com_movimentacao, :xpath, "//td[following-sibling::td[contains(text(),'.')] and preceding-sibling:: td[contains(text(),0)]]"
   elements :list_remover_movimentacao, :xpath, "//a[contains(@href, '/remover')]"
   elements :list_mes, :xpath, "//option[parent::select[@id = 'mes']]"
   elements :list_ano, :xpath,"//option[parent::select[@id = 'ano']]"
   element :btn_buscar, :xpath, "//input[@class = 'btn btn-primary']"
   
end
