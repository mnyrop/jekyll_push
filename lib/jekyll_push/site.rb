# frozen_string_literal: true

module JekyllPush
  #
  #
  class Site
    attr_reader :baseurl, :repo, :dir
    #
    # @param config [Hash] a site configuration hash
    def initialize(config = nil)
      @config   = config || JekyllPush.config_from_file
      @baseurl  = @config.fetch :baseurl, ''
      @repo     = @config.fetch :repo_name, ''
      @dir      = site_dir
    rescue TypeError => e
      raise JekyllPush::Error::InvalidConfig, "An invalid (non-Hash) config was provided.\n#{e}"
    end

    # @return [String]
    def site_dir
      File.join `pwd`.strip, '_site'
    end

    # Use the repostory name as the baseurl when
    # publishing to GitHub pages if available
    #
    # @return [String]
    def gh_baseurl
      if @repo.empty?
        warn Rainbow("Warning: Building the site without the 'repo_name' baseurl is not recommended when using GitHub pages.").yellow if @baseurl.empty?
        @baseurl
      else
        puts Rainbow("Rebuilding with baseurl '/#{@repo}'").cyan
        "/#{@repo}"
      end
    end

    # Rebuild the Jekyll site
    # @return [Nil]
    def rebuild(target)
      @baseurl = gh_baseurl if target == 'gh-pages'

      FileUtils.rm_r @dir if File.directory? @dir

      opts = Jekyll.configuration destination: @dir, baseurl: @baseurl
      Jekyll::Site.new(opts).process
    end
  end
end
