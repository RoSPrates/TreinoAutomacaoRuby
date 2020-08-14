module Contas
  class ContasPage < SitePrism::Page

    elements :lst_contas, :xpath, "//td[following-sibling::td]"

    def clicar_remover(nome)
      xpath = "//td[contains(text(),'" + nome + "')]/following-sibling::td/a[contains(@href,'remover')]"
      find(:xpath, xpath).click
    end

    def clicar_editar(nome)
      xpath = "//td[contains(text(),'" + nome + "')]/following-sibling::td/a[contains(@href,'editar')]"
      find(:xpath, xpath).click
    end

  end
end