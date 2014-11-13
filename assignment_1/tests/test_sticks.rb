require './lib/sticks.rb'
require 'test/unit'

class TestSticks < Test::Unit::TestCase
  def setup
    @sticks = Sticks.new 15
  end

  def test_constructor
    Sticks.new 15
  end

  def test_to_s
    assert_equal 'IIIIIIIIIIIIIII', @sticks.to_s
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
    @sticks.draw_3
    @sticks.draw_3
    @sticks.draw_3
    @sticks.draw_3
    @sticks.draw_2
    assert_equal true, @sticks.game_over?
  end

  private

  def assert_sticks n, message = nil
    assert_equal n, @sticks.to_s.length, message
  end
end
