# frozen_string_literal: true

module Cs133
  class Range
    attr_reader :start_time, :end_time

    def initialize(start_time:, end_time:)
      @start_time = start_time
      @end_time = end_time
    end

    def to_range
      start_time..end_time
    end

    def length
      end_time - start_time
    end
  end
end
