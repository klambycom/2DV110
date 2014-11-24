require 'test_helper'
require './lib/game.rb'

class TestGame < MiniTest::Test
  def setup
    @sticks = mock()
    @game = Game.new @sticks
  end

  def test_draw_1
    @sticks.expects(:draw_1).once
    @sticks.expects(:computer).once
    @game.draw 1
  end

  def test_draw_2
    @sticks.expects(:draw_2).once
    @sticks.expects(:computer).once
    @game.draw 2
  end

  def test_draw_3
    @sticks.expects(:draw_3).once
    @sticks.expects(:computer).once
    @game.draw 3
  end

  def test_draw_invalid_argument
    assert_raises RuntimeError do
      @game.draw :not_a_number
    end
  end
end
