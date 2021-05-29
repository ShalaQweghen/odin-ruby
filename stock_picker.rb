# frozen_string_literal: true

def stock_picker(stocks)
  profit = 0
  picked = []

  stocks.each_with_index do |buy, buy_idx|
    stocks[buy_idx + 1..-1].each_with_index do |sell, sell_idx|
      picked = [buy_idx, sell_idx + buy_idx + 1] if sell - buy > profit && (profit = sell - buy)
    end
  end

  picked
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10]) # => [1, 4]
