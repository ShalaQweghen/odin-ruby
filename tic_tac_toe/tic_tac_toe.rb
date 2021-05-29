# frozen_string_literal: true

require_relative 'game'

puts
puts 'WELCOME TO TIC TAC TOE!'.center(60)
puts "\nChoose your names..."
puts "\nPlayer 1:"

player1 = gets.chomp

puts "\nPlayer 2:"

player2 = gets.chomp

puts

game = Game.new(player1, player2)

until game.over?
  puts 'Enter your move as \'ROW COL\' (e.g. \'1 1\'):'

  row, column = gets.chomp.split.map(&:to_i)

  while row > 3 || row.zero? || column > 3 || column.zero?
    puts "\nRow and column should be numbers between 1 and 3."

    row, column = gets.chomp.split.map(&:to_i)
  end

  if game.spot_occupied?(row - 1, column - 1)
    puts "\nThat spot is already taken!"

    next
  else
    game.play(row, column)
    game.proceed
  end
end

game.show_result
