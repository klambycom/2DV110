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
    when 14
      draw_1
    when 13
      draw_1
    when 12
      draw_3
    when 11
      draw_2
    when 10
      draw_1
    when 9
      draw_1
    when 8
      draw_3
    when 7
      draw_2
    when 6
      draw_1
    when 5
      draw_1
    when 4
      draw_3
    when 3
      draw_2
    when 2
      draw_1
    end
  end

  def to_s
    ('I' * nr_of_sticks) + ('_' * (15 - nr_of_sticks))
  end

  def game_over?
    nr_of_sticks == 0
  end
end
