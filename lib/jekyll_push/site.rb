
# frozen_string_literal: true

module JekyllPush
  #
  #
  class Site
    attr_reader :config

    #
    #
    def initialize(config = nil)
      @config   = config || config_from_file
      @baseurl  = @config.dig 'baseurl'
      @dir      = compiled_site_dir
    end

    #
    #
    def config_from_file
      YAML.load_file "#{`pwd`.strip}/_config.yml"
    end

    def compiled_site_dir
      File.join `pwd`.strip, '_site'
    end

    def files
      Dir.glob "#{@dir}/**/*"
    end


    # Rebuild the Jekyll site with @baseurl
    # @return [Nil]
    def rebuild
      puts Rainbow('Building the gh-pages _site without a baseurl is not recommended').yellow if @baseurl.empty?

      FileUtils.rm_r @dir if File.directory? @dir
      opts = {
        destination: @dir,
        baseurl:  @baseurl,
        verbose: true
      }
      opts['source'] = @config.dig 'source_dir' if @config.key? 'source'

      Jekyll::Site.new(Jekyll.configuration(opts)).process
    end
  end
end
