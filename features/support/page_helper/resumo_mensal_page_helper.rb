Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def resumo_mensal_page
    @resumo_mensal_page ||= ResumoMensal::ResumoMensalPage.new
  end
end
