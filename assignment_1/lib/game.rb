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

  def to_s
    text = %{There is #{@sticks.nr_of_sticks} sticks left
#{@sticks.to_s}

Select number of sticks (the player who draws the last stick looses)

1. Draw 1 stick
2. Draw 2 sticks}

    text += "\n3. Draw 3 sticks" if @sticks.draw_3?

    text
  end
end
