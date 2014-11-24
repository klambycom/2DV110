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
    @sticks.expects(:game_over?).returns(false).at_least_once
    @game.draw 1
  end

  def test_draw_2
    @sticks.expects(:draw_2).once
    @sticks.expects(:computer).once
    @sticks.expects(:game_over?).returns(false).at_least_once
    @game.draw 2
  end

  def test_draw_3
    @sticks.expects(:draw_3).once
    @sticks.expects(:computer).once
    @sticks.expects(:game_over?).returns(false).at_least_once
    @game.draw 3
  end

  def test_draw_invalid_argument
    assert_raises RuntimeError do
      @game.draw :not_a_number
    end
  end

  def test_draw_computer_is_winner
    sticks = mock()
    sticks.expects(:draw_1).once
    sticks.expects(:game_over?).returns(true)
    game = Game.new sticks
    assert_equal :computer, game.draw(1)
  end

  def test_draw_player_is_winner
    sticks = mock()
    sticks.expects(:draw_1).once
    sticks.expects(:computer).once
    sticks.expects(:game_over?).returns(false).then.returns(true).at_least_once
    game = Game.new sticks
    assert_equal :player, game.draw(1)
  end

  def test_draw_no_winner_yet
    sticks = mock()
    sticks.expects(:draw_1).once
    sticks.expects(:computer).once
    sticks.expects(:game_over?).returns(false).at_least_once
    game = Game.new sticks
    assert_equal :none, game.draw(1)
  end
end
