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
          c.action do |args, _options|
            raise Error::MissingBranch, "You must specify a target branch name after 'jekyll push'." if args.empty?

            site   = JekyllPush::Site.new
            branch = JekyllPush::Branch.new args.first

            site.rebuild branch.target
            branch.push site.dir

            puts Rainbow("\nDone ✓").green
          end
        end
      end
    end
  end
end
