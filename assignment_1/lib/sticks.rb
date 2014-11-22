require './lib/metasticks.rb'

class Sticks < MetaSticks
  attr_accessor :nr_of_sticks

  def_draw_for [1, 2, 3]

  def initialize
    @nr_of_sticks = 15
    @last_draw = 0
  end

  def computer
    case nr_of_sticks
    when 12, 8, 4     then draw_3
    when 15, 11, 7, 3 then draw_2
    else draw_1
    end
  end

  def to_s
    ('I' * nr_of_sticks) + ('.' * @last_draw) + ('_' * ((15 - nr_of_sticks) - @last_draw))
  end

  def game_over?
    nr_of_sticks == 0
  end
end
