require './lib/game.rb'
require 'test/unit'
require 'mocha/test_unit'

class TestGame < Test::Unit::TestCase
  def test_game
    Game.new
  end
end
