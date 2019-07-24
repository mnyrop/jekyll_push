# frozen_string_literal: true

module JekyllPush
  #
  #
  class Branch
    attr_reader :target

    # @param target [String]  the name of the Git branch to deploy to
    # @param time   [String]  message with the time of deployment
    def initialize(target)
      @target = JekyllPush::Utils.slugify target
      @time   = Time.now.strftime('%H:%M on %Y-%m-%d')

      (class << self; include JekyllPush::Travis; end) if on_travis?
      (class << self; include JekyllPush::Local; end)  if local?

      @commit = commit
      @origin = origin
      @msg    = msg

      raise JekyllPush::Error::NoOrigin, 'No remote origin was found for the project GitHub repository.' if @origin.empty?
    end

    #
    #
    def on_travis?
      !!ENV.fetch('CI', false)
    end

    #
    #
    def local?
      !on_travis?
    end

    #
    #
    def git_commands
      ['git init && git add .', "git commit -m '#{@commit}'", "git remote add origin #{@origin}", "git push origin master:refs/heads/#{@target} --force"]
    end

    #
    #
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
    #
    def pretty_list(items)
      items.each { |i| puts "\t+ #{i.strip}" }
    end

    #
    #
    def system_try(command)
      puts Rainbow("\nTrying `#{command}`").cyan
      success = system command
      return if success

      raise JekyllPush::Error::SystemCall, Rainbow("JekyllPush Failed on command '#{command}'.")
    end
  end
end
