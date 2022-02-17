require "spec_helper"

module Radar
  RSpec.describe MultipleShipScanner do
    subject(:scanner) { described_class.new(ships, radar_frame) }

    context "two different ships" do
      let(:ships) do
        [
          Ship.new(
            "oo",
            "oo"
          ),
          Ship.new(
            "oo-",
            "ooo"
          )
        ]
      end

      let(:radar_frame) do
        RadarFrame.new(
          "-oo---",
          "-ooooo",
          "----oo",
        )
      end

      it "marks ships" do
        scanner.scan

        expect(radar_frame.line).to eq(
          "-xxx--" \
          "-xxxxx" \
          "----xx"
        )
      end
    end
  end
end
