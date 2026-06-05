# frozen_string_literal: true

require "test_helper"

module Cs133
  class RangeTest < Minitest::Test
    def test_exposes_start_time
      start_time = Time.utc(2026, 6, 1)
      range = Range.new(start_time: start_time, end_time: Time.utc(2026, 6, 30))

      assert_equal start_time, range.start_time
    end

    def test_exposes_end_time
      end_time = Time.utc(2026, 6, 30)
      range = Range.new(start_time: Time.utc(2026, 6, 1), end_time: end_time)

      assert_equal end_time, range.end_time
    end

    def test_to_range_spans_start_through_end
      start_time = Time.utc(2026, 6, 1)
      end_time = Time.utc(2026, 6, 30)
      range = Range.new(start_time: start_time, end_time: end_time)

      assert_equal start_time..end_time, range.to_range
    end

    def test_length_is_the_duration_in_seconds
      range = Range.new(start_time: Time.utc(2026, 6, 1), end_time: Time.utc(2026, 6, 1, 1))

      assert_equal 3600, range.length
    end

    def test_this_month_spans_the_calendar_month_in_zone
      zone = "America/Los_Angeles"
      tz = ActiveSupport::TimeZone[zone]
      range = Range.this_month(zone: zone, now: Time.utc(2026, 6, 15, 12))

      assert_equal tz.local(2026, 6, 1)..tz.local(2026, 6, 30).end_of_day, range.to_range
    end
  end
end
