class Game
  def initialize sticks
    @sticks = sticks
  end

  def draw n
    @sticks.draw_1
    @sticks.computer
  end
end
