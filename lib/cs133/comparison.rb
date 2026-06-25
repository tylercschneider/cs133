# frozen_string_literal: true

module Cs133
  class Comparison
    attr_reader :current, :previous

    def initialize(current:, previous:)
      @current = current
      @previous = previous
    end

    def delta
      current - previous
    end
  end
end
