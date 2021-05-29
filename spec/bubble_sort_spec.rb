# frozen_string_literal: true

require_relative '../bubble_sort'

describe '#bubble_sort' do
  let(:my_array) { [16, 17, 6, 7, 80, 37, 39, 65, 47, 91, 89, 21, 2, 6, 89, 2, 6, 99, 4, 87, 63, 33, 44, 55, 66, 22, 21, 45, 78, 8] }

  it 'returns the sorted array in an increasing order' do
    expect(bubble_sort(my_array)).to eql(my_array.sort)
  end
end

describe '#bubble_sort_by' do
  let(:my_array) { ['hi', 'hello!', 'they', 'bye', 'Mikey', 'top', 'a'] }

  context 'number of characters' do
    it 'returns a sorted array in descreasing order' do
      expect(bubble_sort_by(my_array) { |l, r| l.length - r.length }).to eql(['hello!', 'Mikey', 'they', 'bye', 'top', 'hi', 'a'])
    end

    it 'returns a sorted array in incrasing order' do
      expect(bubble_sort_by(my_array) { |l, r| r.length - l.length }).to eql(['a', 'hi', 'top', 'bye', 'they', 'Mikey', 'hello!'])
    end
  end

  context 'alphabetical order' do
    it 'returns a sorted array in descreasing order' do
      expect(bubble_sort_by(my_array) { |l, r| l <=> r }).to eql(['top', 'they', 'hi', 'hello!', 'bye', 'a', 'Mikey'])
    end

    it 'returns a sorted array in incrasing order' do
      expect(bubble_sort_by(my_array) { |l, r| r <=> l }).to eql(['Mikey', 'a', 'bye', 'hello!', 'hi', 'they', 'top'])
    end
  end
end
