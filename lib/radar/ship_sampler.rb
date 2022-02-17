# frozen_string_literal: true

module Radar
  class RadarFrameSampler
    include ShipCursor

    def initialize(ship, radar_frame)
      @ship = ship
      @radar_frame = radar_frame
    end

    def build_sample(start_position)
      sample = ""

      each_ship_position(start_position) do |position|
        sample += frame_subline(position, ship.width)
      end

      sample
    end

    private

    attr_reader :ship, :radar_frame, :ship_cursor

    def frame_subline(position, length)
      return "" if position < 0

      radar_frame.line[position, length].to_s
    end
  end
end
