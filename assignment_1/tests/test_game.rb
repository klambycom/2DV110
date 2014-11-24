require './lib/game.rb'
require './lib/sticks.rb'
require 'test/unit'
require 'mocha/test_unit'

class TestGame < Test::Unit::TestCase
  def setup
    @game = Game.new(Sticks.new)
  end

  def test_draw_1
    @game.draw_1
  end
end
