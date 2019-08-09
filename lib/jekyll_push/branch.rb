# frozen_string_literal: true

module JekyllPush
  #
  #
  class Branch
    attr_reader :target

    # @param target [String] the name of the Git branch to deploy to
    def initialize(target, opts)
      @target = JekyllPush::Utils.slugify target
      @time   = Time.now.strftime('%H:%M on %Y-%m-%d')

      (class << self; include JekyllPush::Travis; end) if on_travis?
      (class << self; include JekyllPush::Local; end)  if local?

      @commit = commit
      @origin = origin opts
      @msg    = msg

      raise JekyllPush::Error::NoOrigin, 'No remote origin was found for the project GitHub repository.' if @origin.empty?
    end

    #
    # @return [Boolean]
    def on_travis?
      !!ENV.fetch('CI', false)
    end

    #
    # @return [Boolean]
    def local?
      !on_travis?
    end

    #
    # @return [Array]
    def git_commands
      ['git init && git add .', "git commit -m '#{@commit}'", "git remote add origin #{@origin}", "git push origin master:refs/heads/#{@target} --force"]
    end

    #
    # @return [Nil]
    def push(dir)
      files = Dir.glob "#{dir}/**/*"
      raise JekyllPush::Error::NoFilesBuilt, "Found no files inside site directory '#{dir}' to push." if files.empty?

      puts Rainbow("\nFound the following _site files:").cyan
      pretty_list files
      puts Rainbow(@msg).cyan

      Dir.chdir dir
      File.open('.info', 'w') { |f| f.write @time }

      git_commands.each { |cmd| system_try cmd }
    end

    #
    # @return [Nil]
    def pretty_list(items)
      items.each { |i| puts "\t+ #{i.strip}" }
    end

    #
    # @return [Nil]
    def system_try(command)
      puts Rainbow("\nTrying `#{command}`").cyan
      success = system command
      return if success

      raise JekyllPush::Error::SystemCall, Rainbow("JekyllPush Failed on command '#{command}'.")
    end
  end
end
