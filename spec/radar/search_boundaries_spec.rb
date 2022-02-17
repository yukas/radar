require "spec_helper"

module Radar
  RSpec.describe SearchBoundaries do
    subject(:boundaries) { described_class.new(ship, radar_frame) }

    let(:ship) do
      Ship.new(
        "oo",
        "oo"
      )
    end

    let(:radar_frame) do
      RadarFrame.new(
        "-oo-",
        "-oo-",
        "----"
      )
    end

    it "calculates top position" do
      expect(boundaries.top).to eq(-1)
    end

    it "calculates bottom position" do
      expect(boundaries.bottom).to eq(2)
    end

    it "calculates left boundary" do
      expect(boundaries.left).to eq(0)
    end

    it "calculates right boundary" do
      expect(boundaries.right).to eq(2)
    end

    it "calculates bottom right boundary" do
      expect(boundaries.bottom_right).to eq(8)
    end

    it "calculates width" do
      expect(boundaries.width).to eq(4)
    end
  end
end
