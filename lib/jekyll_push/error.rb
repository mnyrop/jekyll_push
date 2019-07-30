# frozen_string_literal: true

module JekyllPush
  module Error
    #
    # @param msg [String] the custom error message
    class RainbowError < StandardError
      def initialize(msg = '')
        super Rainbow(msg).magenta
      end
    end

    class InvalidConfig < RainbowError; end
    class MissingBranch < RainbowError; end
    class NoFilesBuilt  < RainbowError; end
    class NoOrigin      < RainbowError; end
    class SystemCall    < RainbowError; end
  end
end
