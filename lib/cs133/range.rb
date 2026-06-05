# frozen_string_literal: true

module Cs133
  class Range
    def self.this_month(zone:, now: Time.now)
      anchor = now.in_time_zone(zone)
      new(start_time: anchor.beginning_of_month, end_time: anchor.end_of_month)
    end

    def self.last_month(zone:, now: Time.now)
      anchor = now.in_time_zone(zone).prev_month
      new(start_time: anchor.beginning_of_month, end_time: anchor.end_of_month)
    end

    def self.last_7_days(zone:, now: Time.now)
      last_n_days(7, zone: zone, now: now)
    end

    def self.last_30_days(zone:, now: Time.now)
      last_n_days(30, zone: zone, now: now)
    end

    def self.last_n_days(count, zone:, now:)
      anchor = now.in_time_zone(zone)
      new(start_time: (anchor - (count - 1).days).beginning_of_day, end_time: anchor.end_of_day)
    end
    private_class_method :last_n_days

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
