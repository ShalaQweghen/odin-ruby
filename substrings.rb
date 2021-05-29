# frozen_string_literal: true

def substrings(input, dictionary)
  subs = Hash.new(0)

  dictionary.each do |dict_word|
    word_size = dict_word.length

    0.upto(input.length - word_size) { |i| subs[dict_word] += 1 if input[i...i + word_size] == dict_word }
  end

  subs
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

p substrings('below', dictionary) # => { 'below' => 1, 'low' => 1 }
p substrings('Howdy partner, sit down! How\'s it going?', dictionary) # => { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1 }
