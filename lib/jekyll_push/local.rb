# frozen_string_literal: true

module JekyllPush
  #
  #
  module Local
    #
    # @return [String]
    def commit
      "Updated via JekyllPush local task at #{@time}"
    end

    #
    # @return [String]
    def origin(_opts)
      `git config --get remote.origin.url`.strip
    end

    #
    # @return [String]
    def msg
      "\nDeploying to branch '#{@target}' from local task."
    end
  end
end
