# frozen_string_literal: true

# run $ DEBUG=true bundle exec rspec for verbose output
# run $ bundle exec rspec for sparse output
QUIET = !ENV['DEBUG']

# use codecov + add requirements
require 'setup'
require 'simplecov'

SimpleCov.start { add_filter 'spec' }

require 'jekyll_push'
