require "spec_helper"

module Radar
  RSpec.describe RadarFrameCursor do
    subject(:cursor) { described_class.new(boundaries) }

    let(:boundaries) do
      SearchBoundaries.new(
        Ship.new(
          "oo",
          "oo"
        ),
        RadarFrame.new(
          "--o--",
          "-ooo-",
          "-ooo-",
          "-----"
        )
      )
    end

    it "calculates positions" do
      result = []

      cursor.each_position do |position|
        result << position
      end

      expect(result).to match_array(
        [-5, -4, -3, -2, 0, 1, 2, 3, 5, 6, 7, 8, 10, 11, 12, 13, 15, 16, 17, 18]
      )
    end
  end
end
