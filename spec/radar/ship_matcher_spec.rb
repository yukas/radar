require "spec_helper"

module Radar
  RSpec.describe ShipMatcher do
    subject(:matcher) { described_class.new(ship, boundaries, noisiness) }

    let(:boundaries) { SearchBoundaries.new(ship, radar_frame) }

    let(:ship) do
      Ship.new(
        "-o-",
        "o-o"
      )
    end

    let(:radar_frame) { double(width: 2, height: 2) }

    let(:noisiness) { 0 }

    it "matches full ship" do
      expect(matcher.matches?("-o-o-o", 0)).to eq(true)
    end

    it "matches ships bottom half" do
      expect(matcher.matches?("o-o", -2)).to eq(true)
    end

    it "matches ships top half" do
      expect(matcher.matches?("-o-", 2)).to eq(true)
    end

    context "with noisiness" do
      let(:ship) do
        Ship.new(
          "ooooo",
          "ooooo"
        )
      end

      let(:radar_frame) do
        double(width: 4, height: 2)
      end

      context "10% noisiness" do
        let(:noisiness) { 10 }

        it "matches ship with sample" do
          expect(matcher.matches?("ooooooooo-", 0)).to eq(true)
        end
      end

      context "50% noisiness" do
        let(:noisiness) { 50 }

        it "matches ship with sample" do
          expect(matcher.matches?("ooooo-----", 0)).to eq(true)
        end
      end

      context "90% noisiness" do
        let(:noisiness) { 90 }

        it "matches ship with sample" do
          expect(matcher.matches?("---------o", 0)).to eq(true)
        end
      end
    end
  end
end
