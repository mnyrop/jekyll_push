# frozen_string_literal: true

module JekyllPush
  module Local
    #
    #
    def commit
      "Updated via JekyllPush local task at #{@time}"
    end

    #
    #
    def origin
      `git config --get remote.origin.url`.strip
    end

    #
    #
    def msg
      "\nDeploying to branch '#{@target}' from local task."
    end
  end
end
