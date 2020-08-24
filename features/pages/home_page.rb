module Home
  class HomePage < SitePrism::Page

    element :txt_alert_success, :xpath, "//div[@class = 'alert alert-success']"
    elements :menu, :xpath, "//a[contains(@href,'/')]"
    elements :list_contas, :xpath, "//td[following-sibling::td]"

    def escolher_menu(option)
      selecionar_na_lista(option, self.menu)
    end

    def escolher_submenu(menu, submenu)
      escolher_menu(menu)
      selecionar_na_lista(submenu, self.menu)
    end
  end
end
