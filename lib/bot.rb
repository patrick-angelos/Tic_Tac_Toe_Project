require_relative './colorize'

class Bot < Player
  attr_accessor :bot_b
  def initialize(name, letter, level)
    super(name, letter)
    @bot_b = Board.new
    @level = level
  end

  def possible_moves?
    possible_moves = []
    9.times do |i|
      next unless bot_b.make_move?(i + 1, self)

      arr = [i + 1, 0]
      possible_moves.push(arr)
      bot_b.board[i] = ' '
    end
    possible_moves
  end

  def test_moves
    pm = possible_moves?
    return choose_move(pm) if @level == '1'

    pm.each do |move|
      bot_b.make_move?(move[0], self)
      return move[0] if bot_b.win?

      move[1] += test_player_moves
      if @level == '3'
        move[1] -= 0.5 if move[0].even?
        move[1] += 0.5 if move[0] == 5
      end
      bot_b.board[move[0] - 1] = ' '
    end
    choose_move(pm)
  end

  def test_player_moves
    score = 0
    player = Player.new('player', 'X')
    pm = possible_moves?
    pm.each do |move|
      bot_b.make_move?(move[0], player)
      score += -1 if bot_b.win?
      bot_b.board[move[0] - 1] = ' '
    end
    score
  end

  def choose_move(pos_moves)
    score = -99
    selected_moves = []
    pos_moves.each do |move|
      score = move[1] if score < move[1]
    end
    pos_moves.each do |move|
      selected_moves.push(move[0]) if move[1] == score
    end
    selected_moves.sample
  end
end
