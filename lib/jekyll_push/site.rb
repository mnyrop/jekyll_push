# frozen_string_literal: true

module JekyllPush
  #
  #
  class Site
    attr_reader :baseurl, :dir
    #
    #
    def initialize(config = nil)
      @config   = config || config_from_file
      @baseurl  = @config.fetch 'baseurl', ''
      @dir      = compiled_site_dir
    end

    #
    #
    def config_from_file
      YAML.load_file "#{`pwd`.strip}/_config.yml"
    end

    #
    #
    def compiled_site_dir
      File.join `pwd`.strip, '_site'
    end

    # Rebuild the Jekyll site with @baseurl
    # @return [Nil]
    def rebuild
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
