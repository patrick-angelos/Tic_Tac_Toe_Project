class Board
  attr_reader :moves
  attr_accessor :err, :board
  WIN_CASES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = Array.new(9, ' ')
    @moves = 0
  end

  def show
    3.times do |i|
      puts '    -------------'
      puts "    | #{@board[i * 3]} | #{@board[i * 3 + 1]} | #{@board[i * 3 + 2]} |"
    end
    puts '    -------------'
  end

  def make_move?(move, player)
    if move.is_a?(String)
      if move.length > 1
        @err = invalid_error
        return false
      end
      move = move.to_i
    end
    if !move.between?(1, 9)
      @err = invalid_error
      return false
    elsif @board[move - 1] == ' '
      @board[move - 1] = player.letter
      @moves += 1
      return true
    end
    @err = place_taken
    false
  end

  def draw?
    @moves == 9
  end

  def win?
    if @moves > 4
      WIN_CASES.each do |c|
        return true if @board[c[0]] != ' ' && @board[c[0]] == @board[c[1]] && @board[c[0]] == @board[c[2]]
      end
    end
    false
  end
end
