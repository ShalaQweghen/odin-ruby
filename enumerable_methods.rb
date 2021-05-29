# frozen_string_literal: true

module Enumerable
  def my_each
    if block_given?
      for x in self
        yield(x)
      end

      return self
    end

    to_enum
  end

  def my_each_with_index
    if block_given?
      idx = 0

      my_each do |x|
        yield(x, idx)

        idx += 1
      end

      return self
    end

    to_enum
  end

  def my_select
    if block_given?
      selected = []
      my_each { |x| selected << x if yield(x) }

      return selected
    end

    to_enum(:my_select)
  end

  def my_all?
    if block_given?
      c = 0
      my_each { |x| c += 1 if yield(x) }

      return c == size
    end

    true
  end

  def my_any?
    if block_given?
      c = 0
      my_each { |x| c += 1 if yield(x) }

      return c.positive?
    end

    true
  end

  def my_none?
    if block_given?
      c = 0
      my_each { |x| c += 1 if yield(x) }

      return c.zero?
    end

    false
  end

  def my_count(param = nil)
    c = 0

    if param
      my_each { |x| c += 1 if param == x }
    elsif block_given?
      my_each { |x| c += 1 if yield(x) }
    else
      return size
    end

    c
  end

  def my_map(proc = nil)
    return to_enum(:my_map) if !proc && !block_given?

    mapped = []

    if proc || (proc && block_given?)
      my_each { |x| mapped << proc.call(x) }
    elsif block_given?
      my_each { |x| mapped << yield(x) }
    end

    mapped
  end

  def my_inject(param = first)
    my_each_with_index do |x, idx|
      next if param == first && idx.zero?

      param = yield(param, x)
    end

    param
  end
end
