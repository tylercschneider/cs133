# frozen_string_literal: true

require "test_helper"

module Cs133
  class ComparisonTest < Minitest::Test
    def test_delta_is_current_minus_previous
      comparison = Comparison.new(current: 120, previous: 100)

      assert_equal 20, comparison.delta
    end
  end
end
