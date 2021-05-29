# frozen_string_literal: true

class Board
  def initialize
    @board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  # rubocop:disable Metrics/AbcSize
  def display
    puts '    1   2   3'
    puts '  +---+---+---+'
    puts "1 | #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} |"
    puts '  +---+---+---+'
    puts "2 | #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} |"
    puts '  +---+---+---+'
    puts "3 | #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} |"
    puts '  +---+---+---+'
  end
  # rubocop:enable Metrics/AbcSize

  def place_sign(row, col, letter)
    @board[row][col] = letter
  end

  def occupied?(row, col)
    true unless @board[row][col] == ' '
  end

  def sign_aligned?(sign)
    horizontally_aligned?(sign) ||
      vertically_aligned?(sign) ||
      diagonally_aligned?(sign)
  end

  private

  def horizontally_aligned?(sign)
    @board[0].all? { |n| n == sign } || @board[1].all? { |n| n == sign } || @board[2].all? { |n| n == sign }
  end

  def vertically_aligned?(sign)
    3.times do |n|
      return true if [@board[0], @board[1], @board[2]].map { |col| col[n] == sign }.all?
    end

    false
  end

  def diagonally_aligned?(sign)
    [@board[0][0], @board[1][1], @board[2][2]].all? { |n| n == sign } ||
      [@board[0][2], @board[1][1], @board[2][0]].all? { |n| n == sign }
  end
end
