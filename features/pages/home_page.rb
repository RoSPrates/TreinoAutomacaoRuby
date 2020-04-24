class HomePage < SitePrism::Page

    element :txt_login_sucesso, :xpath, "//div[@class = 'alert alert-success']"
    elements :menu, :xpath, "//a[contains(@href,'/')]"
    elements :list_contas, :xpath, "//td[following-sibling::td]"

end