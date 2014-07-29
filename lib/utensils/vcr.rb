require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = {:record => :new_episodes, :preserve_exact_body_bytes => true}
  config.ignore_localhost = true
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.before(:each, :allow_http) do |example|
    raise ':allow_http is deprecated, use :vcr instead'
  end
end
