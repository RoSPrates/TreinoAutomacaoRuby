Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def cadastro_page
    @cadastro_page ||= Cadastro::CadastroPage.new
  end
end
