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
  end
end
