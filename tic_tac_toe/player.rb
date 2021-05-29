# frozen_string_literal: true

class Player
  attr_reader :player1, :player2, :row, :col

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @row = nil
    @col = nil
  end

  def play(row, col)
    @row = row - 1
    @col = col - 1
  end
end
