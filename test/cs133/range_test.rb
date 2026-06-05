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

    # 2026-07-01 03:00 UTC is still 2026-06-30 in Los Angeles, so "last month" is May.
    def test_last_month_uses_the_previous_calendar_month_in_zone
      zone = "America/Los_Angeles"
      tz = ActiveSupport::TimeZone[zone]
      range = Range.last_month(zone: zone, now: Time.utc(2026, 7, 1, 3))

      assert_equal tz.local(2026, 5, 1)..tz.local(2026, 5, 31).end_of_day, range.to_range
    end

    # 2026-06-15 03:00 UTC is still 2026-06-14 in Los Angeles, so the 7-day
    # window (inclusive, day-aligned) is Jun 8 through Jun 14.
    def test_last_7_days_covers_seven_day_aligned_days_ending_today_in_zone
      zone = "America/Los_Angeles"
      tz = ActiveSupport::TimeZone[zone]
      range = Range.last_7_days(zone: zone, now: Time.utc(2026, 6, 15, 3))

      assert_equal tz.local(2026, 6, 8)..tz.local(2026, 6, 14).end_of_day, range.to_range
    end

    def test_last_30_days_covers_thirty_day_aligned_days_ending_today_in_zone
      zone = "America/Los_Angeles"
      tz = ActiveSupport::TimeZone[zone]
      range = Range.last_30_days(zone: zone, now: Time.utc(2026, 6, 15, 3))

      assert_equal tz.local(2026, 5, 16)..tz.local(2026, 6, 14).end_of_day, range.to_range
    end
  end
end
