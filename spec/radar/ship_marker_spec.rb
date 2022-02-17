require "spec_helper"

module Radar
  RSpec.describe ShipMarker do
    subject(:marker) { described_class.new(ship, radar_frame) }

    let(:ship) do
      Ship.new(
        "oo",
        "oo"
      )
    end

    let(:radar_frame) do
      RadarFrame.new(
        "-----",
        "-----",
        "-----",
        "-----"
      )
    end

    it "marks the ship at position 0" do
      marker.mark(0)

      expect(radar_frame.line).to eq(
        "xx---" \
        "xx---" \
        "-----" \
        "-----"
      )
    end

    it "marks the ship at position 13" do
      marker.mark(13)

      expect(radar_frame.line).to eq(
        "-----" \
        "-----" \
        "---xx" \
        "---xx"
      )
    end
  end
end
