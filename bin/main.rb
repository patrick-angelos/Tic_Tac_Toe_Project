#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength
# rubocop:disable Layout/LineLength

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/bot.rb'
require_relative "../lang/en.rb"

b = Board.new()
b.show
player1 = Player.new('Player1', 'X')
player2 = Player.new('Player2', 'O')
state = false;

def turn(player, board)
  puts player.name
  board.make_move?(gets.chomp.to_i, player)
  return player.name if board.win?
  return 'draw' if board.draw?
  system('clear')
  board.show
  false
end

loop do
  state = turn(player1, b)
  break if state
  state = turn(player2, b)
  break if state
end

b.show
state == 'draw' ? (puts "Draw") : (puts "Congrats #{state}")
