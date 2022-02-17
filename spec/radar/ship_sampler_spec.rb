require "spec_helper"

module Radar
  RSpec.describe RadarFrameSampler do
    subject(:sampler) { described_class.new(ship, radar_frame) }

    let(:ship) do
      Ship.new(
        "oo",
        "oo"
      )
    end

    let(:radar_frame) do
      RadarFrame.new(
        "--o--",
        "-ooo-",
        "-ooo-",
        "--o--"
      )
    end

    it "build samples" do
      expect(sampler.build_sample(-1)).to eq("--")

      expect(sampler.build_sample(0)).to eq("---o")
      expect(sampler.build_sample(1)).to eq("-ooo")
      expect(sampler.build_sample(3)).to eq("--o-")
      expect(sampler.build_sample(10)).to eq("-o--")
      expect(sampler.build_sample(12)).to eq("ooo-")
      expect(sampler.build_sample(13)).to eq("o---")

      expect(sampler.build_sample(15)).to eq("--")
    end
  end
end
