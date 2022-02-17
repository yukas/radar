# frozen_string_literal: true

module Radar
  class LineObject
    attr_reader :line

    def initialize(*lines)
      @lines = lines

      @line = lines.join
    end

    def width
      @width ||= lines[0].length
    end

    def height
      @height ||= lines.length
    end

    def size
      line.length
    end

    private

    attr_reader :lines
  end
end
