require 'test_helper'
require './lib/game.rb'
require './lib/sticks.rb'

class TestGame < MiniTest::Test
  def setup
    @game = Game.new(Sticks.new)
  end

  def test_draw_1
    @game.draw_1
  end
end
