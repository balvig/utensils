require 'capybara-screenshot/rspec'
Capybara.save_and_open_page_path = 'public/tmp'
Capybara::Screenshot.append_screenshot_path = false
Capybara::Screenshot.append_timestamp = false
