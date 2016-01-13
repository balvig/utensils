RSpec.configure do |config|
  config.around(:each) do |example|
    DatabaseCleaner[:active_record].strategy = example.metadata[:js] ? :truncation : :transaction

    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
