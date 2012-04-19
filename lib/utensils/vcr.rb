require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = {:record => :new_episodes, :preserve_exact_body_bytes => true}
  config.ignore_localhost = true
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.around(:each, :allow_http) do |example|
    name = example.metadata[:full_description].underscore.gsub(/[^\w\/]+/, "_")
    VCR.use_cassette(name) { example.call }
  end
end
