# frozen_string_literal: true

module Radar
  class ShipMatcher
    extend Forwardable

    def initialize(ship, boundaries, noisiness = 0)
      @ship = ship
      @boundaries = boundaries
      @noisiness = noisiness
    end

    def matches?(sample, position)
      build_distance_value(sample)

      if fully_matching?(position)
        satisfies_distance?(ship.line, sample)
      elsif matching_lower_part?(position)
        satisfies_distance?(ship.tail(sample.length), sample)
      else
        satisfies_distance?(ship.head(sample.length), sample)
      end
    end

    private
    attr_reader :ship, :boundaries, :noisiness, :distance

    def build_distance_value(sample)
      @distance = (sample.length * noisiness / 100).round
    end

    def fully_matching?(position)
      position >= boundaries.left && position < boundaries.bottom_right
    end

    def satisfies_distance?(str1, str2)
      calculate_distance(str1, str2) <= distance
    end

    def calculate_distance(str1, str2)
      Levenshtein.distance(str1, str2)
    end

    def matching_lower_part?(position)
      position < boundaries.left
    end
  end
end
