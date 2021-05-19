def instructions
  system('clear')
  puts "You will have a 3x3 board and player 1 will have the first turn\n"
  puts "When it's your turn enter the number of the square that you want to play (between 1 and 9)"
  puts "Don't choose squares that are already occupied\n\n"
  puts '    -------------'
  puts '    | 1 | 2 | 3 |'
  puts '    -------------'
  puts '    | 4 | 5 | 6 |'
  puts '    -------------'
  puts '    | 7 | 8 | 9 |'
  puts '    -------------'
  puts "\nThe winner is the first one to form a line with 3 symbols vertically, horizontally or diagonally\n"
  puts ''
  puts 'Press Enter to continue'
  gets.chomp
end

def welcome
  'Welcome to Tic-Tac-Toe by Aymen and Patrick'
end

def alone?
  'Are you alone ? (yes/no)'
end

def level?
  "Choose the oppenent level:
  1 - Easy (not so clever)
  2 - Normal (not bad)
  3 - Hard (the best you can do is a draw ^^)"
end

def yes
  'yes'
end

def no
  'no'
end

def player_name?(num)
  "Player #{num}, please enter your name:"
end

def greet_player(player)
  "Hello, #{player.name}, you are '#{player.letter}'\n\n"
end

def see_instructions?
  "Enter 'yes' if you want to see the instructions (Press enter to continue)"
end

def building
  'Building your board...'
end

def done
  "Done.\n"
end

def player_move?(player)
  "#{player.name}, it's your move"
end

def bot_think
  "I'm thinking..."
end

def congrats(winner)
  "\nCongratulations #{winner}, you won!"
end

def draw_it_is
  "\nIt's a draw, nobody won!"
end

def thanks
  puts "Thank you for playing !\n\n\n\n"
  puts 'Sleeping...'
  sleep(3)
  puts 'Good night!'
end

def you_lost(player)
  "Sorry #{player.name}, you lost!"
end

def restart?
  'Do you want to play again ?'
end

# Error messages ----------------------------------------------

def yes_or_no
  'Please respond with yes or no.'
end

def invalid_error
  'Please enter a number between 1 and 9.'
end

def place_taken
  'Please choose another spot, this one is already taken.'
end

def empty_name
  'Please enter at least one charachter as a name'
end

def same_name
  "Please don't use the same name as player 1"
end

def wrong_level
  'Please choose a number between 1 and 3'
end

def same_as_bot
  "Sorry, this is the Bot's name, please choose another name"
end
