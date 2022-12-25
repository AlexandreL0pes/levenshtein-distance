# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../levenshtein_distance_calculator'

class LevenshteinDistanceCalculatorTest < Minitest::Test
  def test_distance_when_source_is_empty
    assert_equal LevenshteinDistanceCalculator.calculate(source: '', target: 'something'), 9
  end

  def test_distance_when_target_is_empty
    assert_equal LevenshteinDistanceCalculator.calculate(source: 'something', target: ''), 9
  end

  def test_distance_when_target_and_source_are_different_and_same_size
    assert_equal LevenshteinDistanceCalculator.calculate(source: 'live', target: 'love'), 1
  end

  def test_distance_when_target_and_source_are_different
    assert_equal LevenshteinDistanceCalculator.calculate(source: 'gumbo', target: 'gambol'), 2
  end
  def test_distance_when_target_and_source_are_equal
    assert_equal LevenshteinDistanceCalculator.calculate(source: 'live', target: 'live'), 0
  end
end
