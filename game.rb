#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require "singleton"

require_relative "core/ball"
require_relative "core/team"
require_relative "core/left_team"
require_relative "core/right_team"
require_relative "core/player"
require_relative "core/world"
require_relative "core/game_window"

GameWindow.instance.show