# frozen_string_literal: true

module JekyllPush
  module Error
    #
    #
    class RainbowError < StandardError
      def initialize(msg = '')
        super(Rainbow(msg).magenta)
      end
    end

     class MissingBranch < RainbowError; end
  end
end
