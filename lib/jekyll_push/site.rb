# frozen_string_literal: true

module JekyllPush
  #
  #
  class Site
    attr_reader :baseurl, :dir
    #
    # @param config [Hash] a site configuration hash
    def initialize(config = nil)
      @config   = config || config_from_file
      @baseurl  = @config.fetch 'baseurl', ''
      @repo     = @config.fetch 'repo_name', ''
      @dir      = site_dir
    end

    #
    # @return [Hash]
    def config_from_file
      path = "#{`pwd`.strip}/_config.yml"
      YAML.load_file path
    rescue StandardError => e
      raise JekyllPush::Error::InvalidConfig, "Could not load config file from path '#{path}'\n#{e}"
    end

    #
    # @return [String]
    def site_dir
      File.join `pwd`.strip, '_site'
    end

    #
    # @return [String]
    def gh_baseurl
      warn Rainbow("Warning: Building the site without the 'repo_name' baseurl is not recommended when using GitHub pages.").yellow and return @baseurl if @repo.empty?

      puts Rainbow("Rebuilding with baseurl '/#{@repo}'").cyan
      "/#{@repo}"
    end

    # Rebuild the Jekyll site
    # @return [Nil]
    def rebuild(target)
      @baseurl = gh_baseurl if target == 'gh-pages'

      FileUtils.rm_r @dir if File.directory? @dir
      opts = {
        destination: @dir,
        baseurl: @baseurl
      }
      opts['source'] = @config.dig 'source_dir' if @config.key? 'source'

      Jekyll::Site.new(Jekyll.configuration(opts)).process
    end
  end
end
