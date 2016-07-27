require 'capybara/poltergeist'
Capybara.register_driver :poltergeist_debug do |app|
  Capybara::Poltergeist::Driver.new(app, inspector: true)
end

Capybara.javascript_driver = if ENV["POLTERGEIST_DEBUG"]
                               :poltergeist_debug
                             else
                               :poltergeist
                             end
