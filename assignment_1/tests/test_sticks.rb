require './lib/sticks.rb'
require 'test/unit'

class TestSticks < Test::Unit::TestCase
  def setup
    @sticks = Sticks.new
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
    @sticks.draw_1
    assert_equal true, @sticks.game_over?
  end

  private

  def assert_sticks n, message = nil
    assert_equal n, @sticks.to_s.length, message
  end

  def draw n
    (0...n).each { @sticks.draw_1 }
  end
end
