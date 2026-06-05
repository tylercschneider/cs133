# frozen_string_literal: true

require "test_helper"

module Cs133
  class ComparisonTest < Minitest::Test
    def test_rejects_ranges_of_different_lengths
      current = Range.new(start_time: Time.utc(2026, 6, 8), end_time: Time.utc(2026, 6, 15))
      shorter = Range.new(start_time: Time.utc(2026, 6, 1), end_time: Time.utc(2026, 6, 4))

      assert_raises(Cs133::Comparison::UnequalLengthError) do
        Comparison.new(current: current, previous: shorter)
      end
    end

    def test_exposes_the_current_range
      current = Range.last_7_days(zone: "America/Los_Angeles", now: Time.utc(2026, 6, 15, 3))
      comparison = Comparison.new(current: current, previous: current.previous)

      assert_same current, comparison.current
    end
  end
end
