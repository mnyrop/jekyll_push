# frozen_string_literal: true


# run $ DEBUG=true bundle exec rspec for verbose output
# run $ bundle exec rspec for sparse output
QUIET = !ENV['DEBUG']

# use codecov + add requirements
require 'setup'
require 'simplecov'

SimpleCov.start do add_filter 'spec' ; end

require 'jekyll_push'
