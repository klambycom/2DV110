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
    assert_equal @sticks.nr_of_sticks, 15
  end

  def test_to_s
    assert_equal @sticks.to_s, 'IIIIIIIIIIIIIII'
  end

  def test_draw_1
    @sticks.draw_1
    assert_equal @sticks.nr_of_sticks, 14
  end

  def test_draw_2
    @sticks.draw_2
    assert_equal @sticks.nr_of_sticks, 13
  end

  def test_draw_3
    @sticks.draw_3
    assert_equal @sticks.nr_of_sticks, 12
  end
end
