require './lib/metasticks.rb'

class Sticks < MetaSticks
  attr_accessor :nr_of_sticks

  def_draw_for [1, 2, 3]

  def initialize
    @nr_of_sticks = 15
  end

  def computer
    case nr_of_sticks
    when 15
      draw_2
    end
  end

  def to_s
    ('I' * nr_of_sticks) + ('_' * (15 - nr_of_sticks))
  end

  def game_over?
    nr_of_sticks == 0
  end
end
