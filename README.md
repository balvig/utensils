# Utensils

Rspec stuff we use over and over again

## Installation

Add this line to your application's Gemfile:

    gem 'utensils'

## Usage

1. Create `spec/support/utensils.rb`
2. Add whichever bits you need:

```ruby
require 'utensils/capybara_extensions'
require 'utensils/custom_matchers'
require 'utensils/database_cleaner'
require 'utensils/upload_macros'
require 'utensils/vcr'
```

### capybara_extensions

Allows you to use active record objects with capybara finders

```ruby
page.within(post) { click_link('Edit') }
page.find(book_2).drag_to(page.find(book_1)) 
```

### custom_matchers

A set of convenient matchers for rspec

```ruby
page.should have_model(post) #looks for dom_id(post)
page.find(post).should have_class('current') #presence of html class
page.should have_image('banner.jpg') #presence of img
page.should have_image(recipe.photo) #presence of dragonfly photo
page.should have_order(recipe_3, recipe_1, recipe_2) #checks that objects are in a specific order
```
### database_cleaner

Sets up rspec to use database_cleaner instead of transactional fixtures

### upload_macros

Provides fixture_file helper pointing to spec/fixtures directory

```ruby
Photo.create(:file => 'dummy.jpg') #attaches spec/fixtures/dummy.jpg
```

### vcr

Disables all outgoing http requests except for examples marked with :allow_http, which will be cached with VCR

```ruby
describe 'examples' do
    it 'uses http cached with VCR', :allow_http do
        ...
    end
    it 'disables all outgoing http' do
        ...
    end
end