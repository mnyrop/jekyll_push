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
          c.action do |args, options|
            raise Error::MissingBranch, "You must specify a target branch name after 'jekyll push'" if args.empty?

            site   = JekyllPush::Site.new
            target = args.first.to_s

            branch = JekyllPush::Branch.new site, target
            branch.push
          end
        end
      end
    end
  end
end
