# frozen_string_literal: true

def caesar_cipher(string, shift)
  string.chars.map do |char|
    if char =~ /[a-zA-Z]/
      char_num_val = char.ord
      lower_bound = char_num_val > 96 ? 97 : 65
      (lower_bound + ((char_num_val - lower_bound + shift) % 26)).chr
    else
      char
    end
  end.join
end
