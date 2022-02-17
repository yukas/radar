require "spec_helper"

module Radar
  RSpec.describe LineObject do
    subject(:line_object) { described_class.new("ooo", "---", "-o-") }

    it "calculates width" do
      expect(line_object.width).to eq(3)
    end

    it "calculates height" do
      expect(line_object.height).to eq(3)
    end

    it "calculates size" do
      expect(line_object.size).to eq(9)
    end
  end
end
