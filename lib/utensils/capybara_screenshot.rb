require 'capybara-screenshot/rspec'
Capybara.save_and_open_page_path = 'public/tmp'
Capybara::Screenshot.append_screenshot_path = false

#TODO: Pull request allowing you to disable timestamps
class Capybara::Screenshot::Saver
  def initialize(capybara, page, html_save=true, filename_prefix='screenshot')
    @capybara, @page, @html_save = capybara, page, html_save
    @file_base_name = filename_prefix
  end
end
