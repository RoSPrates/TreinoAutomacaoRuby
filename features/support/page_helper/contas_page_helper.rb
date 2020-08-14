Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def contas_page
    @contas_page ||= Contas::ContasPage.new
  end
end