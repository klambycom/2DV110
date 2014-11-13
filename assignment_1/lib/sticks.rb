class Sticks
  def initialize nr_of_sticks
    @nr_of_sticks = nr_of_sticks
  end

  def to_s
    str = ''
    (0...@nr_of_sticks).each { str << 'I' }
    str
  end

  def draw_1
    @nr_of_sticks -= 1
  end

  def draw_2
    @nr_of_sticks -= 2
  end

  def draw_3
    @nr_of_sticks -= 3
  end

  def game_over?
    @nr_of_sticks <= 1
  end
end
