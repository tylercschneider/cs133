# frozen_string_literal: true

module Cs133
  class Comparison
    class UnequalLengthError < Error; end

    attr_reader :current

    def initialize(current:, previous:)
      raise UnequalLengthError unless current.length == previous.length

      @current = current
      @previous = previous
    end
  end
end
