# frozen_string_literal: true

class RadarFrameCursor
  extend Forwardable

  def initialize(boundaries)
    @boundaries = boundaries
  end

  def each_position
    (top..bottom).each do |y|
      (left..right).each do |x|
        yield x + y * width
      end
    end
  end

  private

  attr_reader :boundaries

  def_delegators :boundaries,
                 :top,
                 :bottom,
                 :left,
                 :right,
                 :width
end
