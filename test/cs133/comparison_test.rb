# frozen_string_literal: true

require "test_helper"

module Cs133
  class ComparisonTest < Minitest::Test
    def test_delta_is_current_minus_previous
      comparison = Comparison.new(current: 120, previous: 100)

      assert_equal 20, comparison.delta
    end

    def test_percent_change_is_the_fractional_change_from_previous
      comparison = Comparison.new(current: 120, previous: 100)

      assert_in_delta 0.2, comparison.percent_change
    end

    def test_percent_change_is_nil_when_previous_is_zero
      comparison = Comparison.new(current: 120, previous: 0)

      assert_nil comparison.percent_change
    end
  end
end
