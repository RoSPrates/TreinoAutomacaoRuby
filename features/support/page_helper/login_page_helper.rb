Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def login_page
    @login_page ||= Login::LoginPage.new
  end
end
