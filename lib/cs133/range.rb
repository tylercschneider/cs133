# frozen_string_literal: true

module Cs133
  class Range
    def self.this_month(zone:, now: Time.now)
      anchor = now.in_time_zone(zone)
      new(start_time: anchor.beginning_of_month, end_time: anchor.end_of_month)
    end

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
