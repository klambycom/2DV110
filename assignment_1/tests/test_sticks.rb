require './lib/sticks.rb'
require 'test/unit'
require 'mocha/test_unit'

class TestSticks < Test::Unit::TestCase
  def setup
    @sticks = Sticks.new
  end

  def test_to_s
    assert_equal 'IIIIIIIIIIIIIII', @sticks.to_s
  end

  def test_to_s_when_drawn_sticks
    @sticks.draw_3
    assert_equal 'IIIIIIIIIIII___', @sticks.to_s
  end

  def test_draw_1
    @sticks.draw_1
    assert_sticks 14
  end

  def test_draw_2
    @sticks.draw_2
    assert_sticks 13
  end

  def test_draw_3
    @sticks.draw_3
    assert_sticks 12
  end

  def test_game_over?
    @sticks.game_over?
    assert_equal false, @sticks.game_over?
  end

  def test_game_over_when_only_one_stick_or_less
    draw 15
    assert_equal true, @sticks.game_over?
  end

  def test_draw_to_many_1
    draw 15
    assert_raise RuntimeError do
      @sticks.draw_1
    end
  end

  def test_draw_to_many_2
    draw 14
    assert_raise RuntimeError do
      @sticks.draw_2
    end
  end

  def test_draw_to_many_3
    draw 13
    assert_raise RuntimeError do
      @sticks.draw_3
    end
  end

  def test_draw_1?
    assert_equal true, @sticks.draw_1?
  end

  def test_draw_2?
    assert_equal true, @sticks.draw_2?
  end

  def test_draw_3?
    assert_equal true, @sticks.draw_3?
  end

  def test_false_draw_1?
    draw 15
    assert_equal false, @sticks.draw_1?
  end

  def test_false_draw_2?
    draw 14
    assert_equal false, @sticks.draw_2?
  end

  def test_false_draw_3?
    draw 13
    assert_equal false, @sticks.draw_3?
  end

  def test_draw_to_game_over
    draw 14
    assert_equal false, @sticks.game_over?
    draw 1
    assert_equal true, @sticks.game_over?
  end

  def test_getter_for_nr_of_sticks
    @sticks.nr_of_sticks
  end

  def test_computer_15
    @sticks.computer
    assert_equal 13, @sticks.nr_of_sticks
  end

  def test_computer_14
    @sticks.draw_1
    @sticks.computer
    assert_equal 13, @sticks.nr_of_sticks
  end

  def test_computer_13
    @sticks.draw_2
    @sticks.computer
    assert_equal 12, @sticks.nr_of_sticks
  end

  def test_computer_12
    @sticks.draw_3
    @sticks.computer
    assert_equal 9, @sticks.nr_of_sticks
  end

  def test_computer_11
    @sticks.draw_3
    @sticks.draw_1
    @sticks.computer
    assert_equal 9, @sticks.nr_of_sticks
  end

  def test_computer_10
    @sticks.draw_3
    @sticks.draw_2
    @sticks.computer
    assert_equal 9, @sticks.nr_of_sticks
  end

  def test_computer_9
    @sticks.draw_3
    @sticks.draw_3
    @sticks.computer
    assert_equal 8, @sticks.nr_of_sticks
  end

  def test_computer_8
    @sticks.draw_3
    @sticks.draw_3
    @sticks.draw_1
    @sticks.computer
    assert_equal 5, @sticks.nr_of_sticks
  end

  private

  def assert_sticks n, message = nil
    assert_equal n, @sticks.to_s.count('I'), message
  end

  def draw n
    nr_of_sticks = @sticks.nr_of_sticks - n
    @sticks.stubs(:nr_of_sticks).returns(nr_of_sticks)
  end
end
