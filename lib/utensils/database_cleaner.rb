RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction

    DatabaseCleaner.clean_with :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner[:active_record].strategy = example.metadata[:js] ? :truncation : :transaction

    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
