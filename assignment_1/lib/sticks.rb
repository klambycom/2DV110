class Sticks
  attr_reader :nr_of_sticks

  def initialize nr_of_sticks
    @nr_of_sticks = nr_of_sticks
  end

  def to_s
    str = ''
    (0...nr_of_sticks).each { str << 'I' }
    str
  end
end
