# frozen_string_literal: true

module Radar
  class ShipMarker
    include ShipCursor

    def initialize(ship, radar_frame)
      @ship = ship
      @radar_frame = radar_frame
    end

    def mark(start_position)
      each_ship_position(start_position) do |position|
        fill_with_pattern(position, "x", ship.width)
      end
    end

    private

    attr_reader :ship, :radar_frame, :ship_cursor

    def fill_with_pattern(position, pattern, length)
      return if position < 0
      return if position + length > radar_frame.line.length

      radar_frame.line[position, length] = pattern * length
    end
  end
end
