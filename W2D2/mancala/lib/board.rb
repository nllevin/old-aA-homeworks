class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) do |idx|
      if idx == 6 || idx == 13
        []
      else
        place_stones
      end
    end
  end

  def place_stones
    [:stone, :stone, :stone, :stone]
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones, @cups[start_pos] = @cups[start_pos], []

    next_pos = start_pos
    until stones.empty?
      next_pos = (next_pos + 1) % 14
      unless (current_player_name == @name1 && next_pos == 13) || (current_player_name == @name2 && next_pos == 6)
        @cups[next_pos].push(stones.pop)
      end
    end

    render
    next_turn(next_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return ending_cup_idx if @cups[ending_cup_idx].count > 1
    :switch
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } ||
      @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when 1
      return @name1
    when 0
      return :draw
    else
      return @name2
    end
  end
end
