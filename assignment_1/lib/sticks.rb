require './lib/metasticks.rb'

class Sticks < MetaSticks
  def_draw_for [1, 2, 3]

  def initialize
    @nr_of_sticks = 15
  end

  def to_s
    str = ''
    (0...@nr_of_sticks).each { str << 'I' }
    str
  end

  def game_over?
    @nr_of_sticks <= 1
  end
end
