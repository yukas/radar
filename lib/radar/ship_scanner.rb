# frozen_string_literal: true

module Radar
  class ShipScanner
    def initialize(ship, radar_frame, noisiness = 0)
      @ship = ship
      @radar_frame = radar_frame
      @noisiness = noisiness

      @search_boundaries = SearchBoundaries.new(ship, radar_frame)
      @radar_frame_cursor = RadarFrameCursor.new(search_boundaries)
      @radar_frame_sampler = RadarFrameSampler.new(ship, radar_frame)
      @ship_matcher = ShipMatcher.new(ship, search_boundaries, noisiness)
      @ship_marker = ShipMarker.new(ship, radar_frame)
      @ship_checker = ShipChecker.new(radar_frame)
    end

    def scan
      radar_frame_cursor.each_position do |position|
        next if ship_checker.ship_at_position?(position)

        sample = radar_frame_sampler.build_sample(position)

        if ship_matcher.matches?(sample, position)
          ship_marker.mark(position)
        end
      end
    end

    private

    attr_reader :ship,
                :radar_frame,
                :noisiness,
                :search_boundaries,
                :radar_frame_cursor,
                :radar_frame_sampler,
                :ship_matcher,
                :ship_marker,
                :ship_checker
  end
end
