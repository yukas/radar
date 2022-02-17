# frozen_string_literal: true

module Radar
  class Ship < LineObject
    def head(length)
      line[0, length]
    end

    def tail(length)
      line[size - length, length]
    end
  end
end
