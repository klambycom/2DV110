require './lib/sticks.rb'
require 'test/unit'

class TestSticks < Test::Unit::TestCase
  def setup
    @sticks = Sticks.new 15
  end

  def test_constructor
    Sticks.new 15
  end

  def test_nr_of_sticks
    assert_equal 15, @sticks.nr_of_sticks
  end

  def test_to_s
    assert_equal 'IIIIIIIIIIIIIII', @sticks.to_s
  end

  def test_draw_1
    @sticks.draw_1
    assert_equal 14, @sticks.nr_of_sticks
  end

  def test_draw_2
    @sticks.draw_2
    assert_equal 13, @sticks.nr_of_sticks
  end

  def test_draw_3
    @sticks.draw_3
    assert_equal 12, @sticks.nr_of_sticks
  end

  def test_game_over?
    @sticks.game_over?
    assert_equal false, @sticks.game_over?
  end

  def test_game_over_when_only_one_stick_or_less
    @sticks.draw_3
    @sticks.draw_3
    @sticks.draw_3
    @sticks.draw_3
    @sticks.draw_2
    assert_equal true, @sticks.game_over?
  end
end
