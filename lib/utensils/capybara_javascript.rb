require "capybara/poltergeist"

POLTERGEIST_URL_BLACKLIST = %w{
  tpc.googlesyndication.com
  www.googletagservices.com
  fonts.googleapis.com
  www.google-analytics.com
  api.mixpanel.com
  cdn.mxpnl.com
  tofu.example.com
  www.googletagmanager.com
  pagead2.googlesyndication.com
}

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, url_blacklist: POLTERGEIST_URL_BLACKLIST, inspector: ENV["POLTERGEIST_DEBUG"])
end

Capybara.javascript_driver = :poltergeist
