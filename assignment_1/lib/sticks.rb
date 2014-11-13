require './lib/metasticks.rb'

class Sticks < MetaSticks
  def_draw_for [1, 2, 3]

  def initialize
    @nr_of_sticks = 15
  end

  def to_s
    (0...@nr_of_sticks).inject('') { |str| str << 'I' }
  end

  def game_over?
    @nr_of_sticks == 0
  end
end
