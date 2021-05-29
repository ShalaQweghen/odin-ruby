# frozen_string_literal: true

require_relative '../enumerable_methods'

describe Enumerable do
  let(:my_array) { [1, 2, 3] }

  let(:my_proc) { proc { |x| x**2 } }

  describe '#my_each' do
    it 'returns the same results as #each' do
      test_array = []

      expect(my_array.my_each { |n| test_array << n + 10 }).to eql(my_array)
      expect(test_array).to eql([11, 12, 13])
      expect(my_array.my_each).to be_a Enumerator
    end
  end

  describe '#my_each_with_index' do
    it 'returns the same results as #each_with_index' do
      test_array = []

      expect(my_array.my_each_with_index { |n, idx| test_array << n + idx }).to eql(my_array)
      expect(test_array).to eql([1, 3, 5])
      expect(my_array.my_each_with_index).to be_a Enumerator
    end
  end

  describe '#my_select' do
    it 'returns the same results as #select' do
      expect(my_array.my_select { |n| n == 2 }).to eql([2])
      expect(my_array.my_select).to be_a Enumerator
    end
  end

  describe '#my_all?' do
    it 'returns the same results as #all?' do
      expect(my_array.my_all? { |n| n < 4 }).to be true
      expect(my_array.my_all? { |n| n < 3 }).to be false
      expect(my_array.my_all?).to be true
    end
  end

  describe '#my_any?' do
    it 'returns the same results as #any?' do
      expect(my_array.my_any? { |n| n < 2 }).to be true
      expect(my_array.my_any? { |n| n > 3 }).to be false
      expect(my_array.my_any?).to be true
    end
  end

  describe '#my_none?' do
    it 'returns the same results as #none?' do
      expect(my_array.my_none? { |n| n < 1 }).to be true
      expect(my_array.my_none? { |n| n > 1 }).to be false
      expect(my_array.my_none?).to be false
    end
  end

  describe '#my_count' do
    it 'returns the same results as #count' do
      expect(my_array.my_count { |n| n < 3 }).to eql(2)
      expect(my_array.my_count).to eql(3)
      expect(my_array.my_count(2)).to eql(1)
    end
  end

  describe '#my_map' do
    it 'returns the same results as #map' do
      expect(my_array.my_map { |n| n + 2 }).to eql([3, 4, 5])
      expect(my_array.my_map(my_proc)).to eql([1, 4, 9])
      expect(my_array.my_map(my_proc) { |n| n + 2 }).to eql([1, 4, 9])
      expect(my_array.my_map).to be_a Enumerator
    end
  end

  describe '#my_inject' do
    it 'returns the same results as #inject' do
      expect(my_array.my_inject { |a, b| a + b }).to eql(6)
      expect(my_array.my_inject(10) { |a, b| a + b }).to eql(16)
      expect(my_array.my_inject(&:*)).to eql(6)
    end
  end
end
