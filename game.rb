#!/usr/bin/env ruby
# encoding: utf-8
require "gosu"
require "singleton"

require_relative "core/environment/game_window"
require_relative "core/environment/world"
require_relative "core/environment/ball"
require_relative "core/teams/team"
require_relative "core/teams/left_team"
require_relative "core/teams/right_team"
require_relative "core/players/player"
require_relative "core/players/goalkeeper"
require_relative "core/players/defender"
require_relative "core/players/midfielder"
require_relative "core/players/forward"

GameWindow.instance.show