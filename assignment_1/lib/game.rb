class Game
  def initialize sticks
    @sticks = sticks
  end

  def draw n
    case n
    when 1 then @sticks.draw_1
    when 2 then @sticks.draw_2
    when 3 then @sticks.draw_3
    end

    @sticks.computer
  end
end
