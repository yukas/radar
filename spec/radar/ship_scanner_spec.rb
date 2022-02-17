require "spec_helper"

module Radar
  RSpec.describe ShipScanner do
    subject(:scanner) { described_class.new(ship, radar_frame) }

    context "one occurance of the ship" do
      let(:ship) do
        Ship.new(
          "-o-",
          "ooo",
          "ooo",
          "-o-",
        )
      end

      let(:radar_frame) do
        RadarFrame.new(
          "--o--",
          "-ooo-",
          "-ooo-",
          "--o--",
        )
      end

      it "marks the ship" do
        scanner.scan

        expect(radar_frame.line).to eq(
          "-xxx-" \
          "-xxx-" \
          "-xxx-" \
          "-xxx-"
        )
      end
    end

    context "two occurances of the ship" do
      let(:ship) do
        Ship.new(
          "oo",
          "oo"
        )
      end

      let(:radar_frame) do
        RadarFrame.new(
          "-----",
          "-oo--",
          "-oooo",
          "---oo",
        )
      end

      it "marks ships" do
        scanner.scan

        expect(radar_frame.line).to eq(
          "-----" \
          "-xx--" \
          "-xxxx" \
          "---xx"
        )
      end
    end

    context "bottom half of the ship" do
      let(:ship) do
        Ship.new(
          "oo",
          "oo",
          "oo"
        )
      end

      let(:radar_frame) do
        RadarFrame.new(
          "-oo-",
          "-oo-",
          "----",
        )
      end

      it "marks half of the ship" do
        scanner.scan

        expect(radar_frame.line).to eq(
          "-xx-" \
          "-xx-" \
          "----"
        )
      end
    end

    context "top half of the ship" do
      let(:ship) do
        Ship.new(
          "oo",
          "oo",
          "oo"
        )
      end

      let(:radar_frame) do
        RadarFrame.new(
          "----",
          "-o--",
          "-oo-",
        )
      end

      it "marks half of the ship" do
        scanner.scan

        expect(radar_frame.line).to eq(
          "----" \
          "-o--" \
          "-xx-"
        )
      end
    end
  end
end
