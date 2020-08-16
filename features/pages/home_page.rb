module Home
  class HomePage < SitePrism::Page

    element :txt_alert_success, :xpath, "//div[@class = 'alert alert-success']"
    elements :menu, :xpath, "//a[contains(@href,'/')]"
    elements :list_contas, :xpath, "//td[following-sibling::td]"

  end
end
