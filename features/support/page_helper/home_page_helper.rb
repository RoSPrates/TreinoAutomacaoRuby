Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def contas_page
    @home_page ||= Home::HomePage.new
  end
end
