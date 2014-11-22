require './lib/metasticks.rb'

class Sticks < MetaSticks
  attr_accessor :nr_of_sticks

  def_draw_for [1, 2, 3]

  def initialize
    @nr_of_sticks = 15
  end

  def computer
    case nr_of_sticks
    when 14..15
      @nr_of_sticks = 13
    when 10..12
      @nr_of_sticks = 9
    when 6..8
      @nr_of_sticks = 5
    when 2..4
      @nr_of_sticks = 1
    else
      @nr_of_sticks -= 1
    end
  end

  def to_s
    ('I' * nr_of_sticks) + ('_' * (15 - nr_of_sticks))
  end

  def game_over?
    nr_of_sticks == 0
  end
end
