# frozen_string_literal: true

class ShipChecker
  def initialize(radar_frame)
    @radar_frame = radar_frame
  end

  def ship_at_position?(position)
    !["o", "-"].include?(radar_frame.line[position])
  end

  private

  attr_reader :radar_frame
end
