require "spec_helper"

module Radar
  RSpec.describe Ship do
    subject(:ship) { described_class.new("ooo", "---", "-o-") }

    it "returns head of line" do
      expect(ship.head(3)).to eq("ooo")
    end

    it "returns tail of line" do
      expect(ship.tail(3)).to eq("-o-")
    end
  end
end
