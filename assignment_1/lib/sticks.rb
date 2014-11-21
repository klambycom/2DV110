require './lib/metasticks.rb'

class Sticks < MetaSticks
  attr_reader :nr_of_sticks

  def_draw_for [1, 2, 3]

  def initialize
    @nr_of_sticks = 15
    @drawn_sticks = 0
  end

  def to_s
    ('I' * @nr_of_sticks) + ('_' * @drawn_sticks)
  end

  def game_over?
    @nr_of_sticks == 0
  end
end
