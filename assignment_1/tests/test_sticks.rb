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
end
