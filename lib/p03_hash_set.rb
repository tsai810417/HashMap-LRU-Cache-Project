require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    num *= -1 if num < 0
    while @count == num_buckets
      resize!
    end
    @store[num % num_buckets].push(key)
    @count += 1
  end

  def include?(key)
    num = key.hash
    num *= -1 if num < 0
    @store[num % num_buckets].include?(key)
  end

  def remove(key)
    num = key.hash
    num *= -1 if num < 0
    @store[num % num_buckets].delete(key)
    @count -= 1
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
