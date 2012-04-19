module Utensils
  module UploadMacros
    def fixture_file(filename)
      File.new(fixture_file_path(filename))
    end

    def fixture_file_path(filename)
      Rails.root.join('spec','fixtures',filename)
    end
  end
end

RSpec.configure do |config|
  config.include(Utensils::UploadMacros)
end
