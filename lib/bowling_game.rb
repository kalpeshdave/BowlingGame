class BowlingGame
  def initialize(*total_knocked_pins)
    raise "Please provie valid input score for each run" if total_knocked_pins.size < 20 || total_knocked_pins.empty?
    @frames = []
    total_knocked_pins.each_slice(2) {|slice| @frames << slice}

    raise "For each frame knocked pins should not exceeds 10" if @frames.any?{|ar| ar.inject(0, :+)  > 10}
    @score = 0
  end

  def knockdown_score
      @frames.each_with_index do |shot, index|
          @score = score + get_points(shot, @frames[index+1])
      end
      @score
  end

  def  get_points(shot, next_shot)
    count_pins = 0
    # STRIKE
    if shot.first == 10
        count_pins = next_shot.nil? ? 10 : 10+next_shot.inject(0, :+)
    # SPARE
        elsif shot.inject(0, :+) == 10
        count_pins = next_shot.nil? ? 10 : 10 + next_shot.first
    else
        count_pins = shot.inject(0, :+)
    end
    return count_pins
    end

  def score
    @score
  end
end
