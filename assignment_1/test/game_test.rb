require 'test_helper'
require './lib/game.rb'
require './lib/sticks.rb'

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

  def test_to_s
    game = Game.new(Sticks.new)

    text = %{There is 15 sticks left
IIIIIIIIIIIIIII

Select number of sticks (the player who draws the last stick looses)

1. Draw 1 stick
2. Draw 2 sticks
3. Draw 3 sticks}

    assert_equal text, game.to_s
  end

  def test_to_s_drawn_sticks
    sticks = Sticks.new
    game = Game.new sticks

    sticks.draw_2
    sticks.draw_3

    text = %{There is 10 sticks left
IIIIIIIIII...__

Select number of sticks (the player who draws the last stick looses)

1. Draw 1 stick
2. Draw 2 sticks
3. Draw 3 sticks}

    assert_equal text, game.to_s
  end

  def test_to_s_2_sticks_left
    sticks = Sticks.new
    game = Game.new sticks

    (0...13).each { sticks.draw_1 }

    text = %{There is 2 sticks left
II.____________

Select number of sticks (the player who draws the last stick looses)

1. Draw 1 stick
2. Draw 2 sticks}

    assert_equal text, game.to_s
  end

  def test_to_s_1_stick_left
    sticks = Sticks.new
    game = Game.new sticks

    (0...14).each { sticks.draw_1 }

    text = %{There is 1 sticks left
I._____________

Select number of sticks (the player who draws the last stick looses)

1. Draw 1 stick}

    assert_equal text, game.to_s
  end
end
