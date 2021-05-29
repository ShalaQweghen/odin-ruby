# frozen_string_literal: true

def bubble_sort(array)
  sorted = array.clone

  sorted.each_index do |i|
    sorted.each_index do |j|
      sorted[i], sorted[j] = sorted[j], sorted[i] if sorted[i] < sorted[j]
    end
  end

  sorted
end

def bubble_sort_by(array, &block)
  sorted = array.clone

  sorted.each_index do |i|
    sorted.each_index do |j|
      sorted[i], sorted[j] = sorted[j], sorted[i] if block.call(sorted[j], sorted[i]).negative?
    end
  end

  sorted
end
