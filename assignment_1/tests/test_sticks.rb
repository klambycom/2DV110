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
    assert_equal 'IIIIIIIIIIII...', @sticks.to_s
    @sticks.draw_2
    assert_equal 'IIIIIIIIII..___', @sticks.to_s
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
    assert_computer start: 15, expected: 13
  end

  def test_computer_14
    assert_computer start: 14, expected: 13
  end

  def test_computer_13
    assert_computer start: 13, expected: 12
  end

  def test_computer_12
    assert_computer start: 12, expected: 9
  end

  def test_computer_11
    assert_computer start: 11, expected: 9
  end

  def test_computer_10
    assert_computer start: 10, expected: 9
  end

  def test_computer_9
    assert_computer start: 9, expected: 8
  end

  def test_computer_8
    assert_computer start: 8, expected: 5
  end

  def test_computer_7
    assert_computer start: 7, expected: 5
  end

  def test_computer_6
    assert_computer start: 6, expected: 5
  end

  def test_computer_5
    assert_computer start: 5, expected: 4
  end

  def test_computer_4
    assert_computer start: 4, expected: 1
  end

  def test_computer_3
    assert_computer start: 3, expected: 1
  end

  def test_computer_2
    assert_computer start: 2, expected: 1
  end

  def test_computer_1
    assert_computer start: 1, expected: 0
  end

  private

  def assert_sticks n, message = nil
    assert_equal n, @sticks.to_s.count('I'), message
  end

  def draw n
    nr_of_sticks = @sticks.nr_of_sticks - n
    @sticks.stubs(:nr_of_sticks).returns(nr_of_sticks)
  end

  def assert_computer hash = {}
    (0...(15 - hash[:start])).each { @sticks.draw_1 }
    @sticks.computer
    assert_equal hash[:expected], @sticks.nr_of_sticks, hash[:message]
  end
end
