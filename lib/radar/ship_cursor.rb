# frozen_string_literal: true

module Radar
  module ShipCursor
    def each_ship_position(start_position)
      (0...ship.height).each do |y|
        yield start_position + y * radar_frame.width
      end
    end
  end
end
