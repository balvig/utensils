# Utensils

Rspec stuff we use over and over again

## Installation

Add this line to your application's Gemfile:

    gem 'utensils', :group => :test

## Usage

1. Create `spec/support/utensils.rb`
2. Add whichever bits you need:

```ruby
require 'utensils/capybara_extensions'
require 'utensils/capybara_javascript'
require 'utensils/capybara_screenshot'
require 'utensils/custom_matchers'
require 'utensils/database_cleaner'
require 'utensils/email'
require 'utensils/factory_bot'
require 'utensils/omniauth'
require 'utensils/timecop'
require 'utensils/upload_macros'
require 'utensils/vcr'
```

### capybara_extensions

Allows you to use active record objects with capybara finders

```ruby
page.within(post) { click_link('Edit') }
page.find(book_2).drag_to(page.find(book_1))
```

### capybara_javascript

Switches javascript driver to poltergeist, and blacklists slow external JS

To use Poltegeist with [remote debugging](https://github.com/teampoltergeist/poltergeist/blob/master/README.md#remote-debugging-experimental), run test with `POLTERGEIST_DEBUG` set.

```sh
POLTERGEIST_DEBUG=1 rspec spec/features/broken_feature_spec.rb
```

### capybara_screenshot

Automatically saves an html file viewable at
localhost:3000/tmp/screenshot.html on failing specs

### custom_matchers

A set of convenient matchers for rspec

```ruby
page.should have_model(post) #looks for dom_id(post)
page.find(post).should have_class('current') #presence of html class
page.should have_image('banner.jpg') #presence of img
page.should have_image(recipe.photo) #presence of dragonfly photo
page.should have_order(recipe_3, recipe_1, recipe_2, within: '#recipes') #checks that objects are in a specific order
```

### database_cleaner

Sets up rspec to use database_cleaner instead of transactional fixtures

### email

Clears `ActionMailer::Base.deliveries` before each spec and
includes https://github.com/bmabey/email-spec helpers.

### factory_bot

Use shorthand for FactoryBot, ie:

```ruby
# instead of:
FactoryBot.create(:post)

# use:
create(:post)
```

### omniauth

Puts ominauth in test mode and provides the following macros:

```ruby
stub_oauth(:facebook, info: { name: 'Bob' })
stub_oauth_error(:facebook)
login(user)
```

### timecop

Resets timecop after each spec

### upload_macros

Provides fixture_file and fixture_file_path helper pointing to spec/fixtures directory

```ruby
fixture_file_path('dummy.jpg') # 'spec/fixtures/dummy.jpg'
Photo.create(:file => fixture_file('dummy.jpg')) # attaches File spec/fixtures/dummy.jpg
```

### vcr

Configures vcr to work with rspec and disables all outgoing http requests not marked with :vcr

```ruby
describe 'examples' do
  it 'uses http cached with VCR', :vcr do
    ...
  end
  it 'disables all outgoing http' do
    ...
  end
end
