def take_screenshot(name_file, folder = 'report/screenshots/test_screens')
  name_file = name_file.to_s.gsub(' ', '_')
  file = "#{folder}/#{name_file}.png"
  FileUtils.mkdir_p(folder) unless File.exist?(folder)
  Capybara.page.driver.browser.save_screenshot(file)
  embed(file, 'image/png', file)
end
