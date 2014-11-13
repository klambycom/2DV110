class MetaSticks
  protected

  def self.def_draw_for ns
    ns.each do |i|
      define_method("draw_#{i}") do
        raise 'No sticks left' if @nr_of_sticks <= (i - 1)
        @nr_of_sticks -= i
      end

      define_method("draw_#{i}?") { true }
    end
  end
end
