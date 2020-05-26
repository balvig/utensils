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
require 'utensils/database_cleaner'
require 'utensils/email'
require 'utensils/factory_bot'
require 'utensils/omniauth'
require 'utensils/upload_macros'
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
