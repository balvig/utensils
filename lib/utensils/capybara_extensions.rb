module Capybara
  module Node
    module Finders
      def find(*args)
        args = '#' + ApplicationController.helpers.dom_id(args.first) if args.first.respond_to?(:to_key)
        wait_until { first(*args) or raise_find_error(*args) }
      end
    end
  end
end