# frozen_string_literal: true

module JekyllPush
  #
  #
  module Travis
    #
    # @return [String]
    def commit
      "Updated via JekyllPush Travis \"#{ENV['TRAVIS_COMMIT']}\" at #{@time}."
    end

    #
    # @return [String]
    def origin(opts)
      @repo_slug = ENV['TRAVIS_REPO_SLUG']
      @user      = opts.fetch :user, @repo_slug.split('/').first
      @token     = opts.fetch :pw, ENV['ACCESS_TOKEN']

      "https://#{@user}:#{@token}@github.com/#{@repo_slug}.git"
    end

    #
    # @return [String]
    def msg
      "\nDeploying to branch '#{@target}' from Travis as #{@user}."
    end
  end
end
