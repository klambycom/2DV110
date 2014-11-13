require './lib/sticks.rb'
require 'test/unit'

class TestSticks < Test::Unit::TestCase
  def test_constructor
    Sticks.new 15
  end

  def test_nr_of_sticks
    sticks = Sticks.new 15
    assert_equal sticks.nr_of_sticks, 15
  end

  def test_to_s
    sticks = Sticks.new 15
    assert_equal sticks.to_s, 'IIIIIIIIIIIIIII'
  end

  def test_draw_1
    sticks = Sticks.new 15
    sticks.draw_1
    assert_equal sticks.nr_of_sticks, 14
  end

  def test_draw_2
    sticks = Sticks.new 15
    sticks.draw_2
    assert_equal sticks.nr_of_sticks, 13
  end
end
