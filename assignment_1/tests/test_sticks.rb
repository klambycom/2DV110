require './lib/sticks.rb'
require 'test/unit'

class TestSticks < Test::Unit::TestCase
  def test_constructor
    Sticks.new
  end
end
