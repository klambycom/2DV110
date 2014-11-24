class Game
  def initialize sticks
    @sticks = sticks
  end

  def draw n
    # Players draw
    case n
    when 1 then @sticks.draw_1
    when 2 then @sticks.draw_2
    when 3 then @sticks.draw_3
    else raise "Invalid argument"
    end

    # Computer is winner if player had last draw
    return :computer if @sticks.game_over?

    # Computers draw
    @sticks.computer

    # Player is winner if computer had last draw
    return :player if @sticks.game_over?

    # No winner yet
    return :none
  end
end
