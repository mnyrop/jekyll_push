# frozen_string_literal: true

module JekyllPush
  #
  #
  class Command < Jekyll::Command
    class << self
      def init_with_program(prog)
        prog.command(:push) do |c|
          c.syntax 'push [args]'
          c.description 'pushes compiled site to specified github branch'
          c.option :user, '--user USER', 'Override GitHub user name use'
          c.option :pw, '--pw PASSWORD', 'Override GitHub user password to use'
          c.action do |args, opts|
            raise Error::MissingBranch, "You must specify a target branch name after 'jekyll push'." if args.empty?

            args.each { |a| JekyllPush.run_command a, opts }
          end
        end
      end
    end
  end
end
