module Utensils
  module UploadMacros
    include ActionDispatch::TestProcess

    def fixture_file_upload(filename = nil)
      super fixture_file_path(filename)
    end

    def fixture_file(filename = nil)
      File.new fixture_file_path(filename)
    end

    def fixture_file_path(filename = nil)
      filename ||= "photo.jpg"
      Rails.root.join('spec', 'fixtures', filename)
    end
  end
end

RSpec.configure do |config|
  config.include(Utensils::UploadMacros)
end
