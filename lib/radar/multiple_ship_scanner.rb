# frozen_string_literal: true

module Radar
  class MultipleShipScanner
    def initialize(ships, radar_frame, noisiness = 0)
      @ships = ships
      @radar_frame = radar_frame
      @noisiness = noisiness
    end

    def scan
      sorted_ships.each do |ship|
        ShipScanner.new(ship, radar_frame, noisiness).scan
      end
    end

    private
    attr_reader :ships, :radar_frame, :noisiness

    def sorted_ships
      ships.sort { |a, b|  a.size <=> b.size }.reverse
    end
  end
end
