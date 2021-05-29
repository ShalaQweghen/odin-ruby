# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_reader :turns

  def initialize(player1, player2)
    @board = Board.new
    @players = Player.new(player1, player2)

    @turns = 0
    @toss = rand(2)

    show_opponents

    @board.display

    turn
  end

  def play(row, col)
    @players.play(row, col)
  end

  def proceed
    @board.place_sign(@players.row, @players.col, letter)
    @board.display

    turn unless over?
  end

  def spot_occupied?(row, col)
    @board.occupied?(row, col)
  end

  def over?
    win? || tie?
  end

  def show_result
    win? ? show_victory : show_tie
  end

  private

  def tie?
    @turns > 9
  end

  def win?
    @board.sign_aligned?('X') || @board.sign_aligned?('O')
  end

  def show_opponents
    puts "#{@players.player1} vs #{@players.player2}"
  end

  def current_player
    if @turns.odd?
      @toss.zero? ? @players.player1 : @players.player2
    else
      @toss.zero? ? @players.player2 : @players.player1
    end
  end

  def letter
    if @toss.zero?
      @turns.odd? ? 'X' : 'O'
    else
      @turns.odd? ? 'O' : 'X'
    end
  end

  def turn
    if @turns.zero?
      puts @toss.zero? ? "\nIt's #{@players.player1}'s turn." : "\nIts's #{@players.player2}'s turn."
    else
      puts "\nIt's #{current_player}'s turn."
    end

    @turns += 1
  end

  def show_victory
    puts
    puts "'#{current_player}' has won!".upcase.center(60)
    puts
  end

  def show_tie
    puts
    puts "Game Over!!! It's a tie!".upcase.center(60)
    puts
  end
end
