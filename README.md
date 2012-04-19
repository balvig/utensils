# Utensils

Rspec stuff we use over and over again

## Installation

Add this line to your application's Gemfile:

    gem 'utensils'

## Usage

1. Create a utensils.rb file in spec/support
2. Add whichever bits you need:

```ruby
require 'utensils/custom_matchers'
require 'utensils/upload_macros'
require 'utensils/capybara_extensions'
require 'utensils/database_cleaner'
require 'utensils/vcr'
```