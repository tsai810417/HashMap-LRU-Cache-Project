require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true if @store[num] == false
  end

  def remove(num)
    @store[num] = false if @store[num] == true
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].each do | el |
      return true if el == num
    end
    return false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % 20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    while num >= num_buckets || @count == num_buckets
      resize!
    end
    self[num].push(num)
    @count += 1
  end

  def remove(num)
    @store[num] = []
    @count -= 1
  end

  def include?(num)
    !self[num].empty?
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store = @store.concat(Array.new(num_buckets) { Array.new })
  end
end
