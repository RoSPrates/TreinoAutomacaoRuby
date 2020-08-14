Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def movimentacao_page
    @movimentacao_page ||= Movimentacao::MovimentacaoPage.new
  end
end
