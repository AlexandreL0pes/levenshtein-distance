# frozen_string_literal: true 

class LevenshteinDistanceCalculator
  attr_accessor :n, :m, :source, :target, :d

  def initialize(source, target)
    @source = source
    @target = target
  end

  def self.calculate(source:, target:)
    self.new(source, target).calculate
  end

  def calculate
    @n = source.size
    @m = target.size

    return n if m.zero?
    return m if n.zero?

    @d = Array.new(n + 1) { Array.new(m + 1) { 0 } }

    (0..n).each { |i| d[i][0] = i }
    (0..m).each { |i| d[0][i] = i }

    for i in (1..n)
      for j in (1..m)
        cost = source[i] == target[j] ? 0 : 1

        diagonal_position = d[i - 1][j - 1] + cost
        upper_position = d[i-1][j] + 1
        left_position = d[i][j - 1] + 1

        d[i][j] = [upper_position, left_position, diagonal_position].min
      end
    end

    d[n - 1][m - 1]
  end
end
