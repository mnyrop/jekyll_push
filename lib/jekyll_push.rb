# frozen_string_literal: true

# 3rd party
require 'jekyll'
require 'rainbow'

# relative
require_relative 'jekyll_push/branch'
require_relative 'jekyll_push/command'
require_relative 'jekyll_push/error'
require_relative 'jekyll_push/local'
require_relative 'jekyll_push/site'
require_relative 'jekyll_push/travis'
require_relative 'jekyll_push/utils'

#
#
module JekyllPush
  #
  # @return [Nil]
  def self.run_command(arg)
    site   = JekyllPush::Site.new
    branch = JekyllPush::Branch.new arg

    site.rebuild branch.target
    branch.push site.dir

    puts Rainbow("\nDone ✓").green
  end

  #
  # @return [String]
  def self.config_path
    "#{`pwd`.strip}/_config.yml"
  end

  #
  # @return [Hash]
  def self.config_from_file(path = config_path)
    YAML.load_file path
  rescue StandardError => e
    raise JekyllPush::Error::InvalidConfig, "Could not load config file from path '#{path}'\n#{e}"
  end
end
