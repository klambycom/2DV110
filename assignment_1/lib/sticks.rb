require './lib/metasticks.rb'

class Sticks < MetaSticks
  attr_accessor :nr_of_sticks

  def_draw_for [1, 2, 3]

  def initialize
    @nr_of_sticks = 15
    @last_draw = 0
  end

  def computer
    @nr_of_sticks = case nr_of_sticks
      when 14..15 then 13
      when 10..12 then 9
      when 6..8 then 5
      when 2..4 then 1
      else @nr_of_sticks - 1
    end
  end

  def to_s
    ('I' * nr_of_sticks) + ('.' * @last_draw) + ('_' * ((15 - nr_of_sticks) - @last_draw))
  end

  def game_over?
    nr_of_sticks == 0
  end
end
