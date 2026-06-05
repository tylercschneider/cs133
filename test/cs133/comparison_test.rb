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
  end
end
