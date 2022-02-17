# frozen_string_literal: true

module Radar
  class SearchBoundaries
    VERTICAL_PARTIAL_MATCH_FACTOR = 2

    def initialize(ship, radar_frame)
      @ship = ship
      @radar_frame = radar_frame
    end

    def top
      -vertical_partial_match_offset
    end

    def bottom
      radar_frame.height - vertical_partial_match_offset
    end

    def left
      0
    end

    def right
      width - ship.width
    end

    def bottom_right
      bottom * width
    end

    def width
      radar_frame.width
    end

    private

    attr_reader :ship, :radar_frame

    def vertical_partial_match_offset
      ship.height / VERTICAL_PARTIAL_MATCH_FACTOR
    end
  end
end
