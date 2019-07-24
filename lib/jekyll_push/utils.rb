# frozen_string_literal: true

module JekyllPush
  #
  #
  module Utils
    #
    #
    def self.slugify(str)
      safe = str.to_s.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      warn Rainbow("Warning: '#{str}' is not an acceptable branch name. Using '#{safe}' instead.").orange unless safe.eql?(str)
      safe
    end
  end
end
