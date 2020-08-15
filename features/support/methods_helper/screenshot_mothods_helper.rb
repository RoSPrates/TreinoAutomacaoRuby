def take_screenshot(name_file, folder = 'screenshots/test_screens')
  file = "#{folder}/#{name_file}.png"
  FileUtils.mkdir_p(folder) unless File.exist?(folder)
  screen file
end

def screen (name_file)
  Capybara.page.driver.browser.save_screenshot(name_file)
end

def report_screenshot
  screen "image.png"
  embed("image.png", 'image/png')
end
