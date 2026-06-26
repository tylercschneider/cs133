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

    def percent_change
      return if previous.zero?

      delta / previous.to_f
    end

    def direction
      :up if delta.positive?
    end
  end
end
