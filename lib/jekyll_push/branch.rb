# frozen_string_literal: true

module JekyllPush
  class Branch
    # @param site   [Hash]    the jekyll site & config
    # @param target [String]  the name of the Git branch to deploy to
    # @param time   [String]  message with the time of deployment

    def initialize(site, target)
      @site   = site
      @target = target
      @time   = Time.now.strftime('Updated at %H:%M on %Y-%m-%d')
    end

    def push
      @site.rebuild
    end
  end
end
