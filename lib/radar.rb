# frozen_string_literal: true

require "bundler/setup"
require "levenshtein"
require "forwardable"

require_relative "./radar/line_object"
require_relative "./radar/search_boundaries"
require_relative "./radar/radar_frame"
require_relative "./radar/radar_frame_cursor"
require_relative "./radar/ship"
require_relative "./radar/ship_cursor"
require_relative "./radar/ship_checker"
require_relative "./radar/ship_marker"
require_relative "./radar/ship_matcher"
require_relative "./radar/ship_sampler"
require_relative "./radar/ship_scanner"
require_relative "./radar/multiple_ship_scanner"

module Radar
end
