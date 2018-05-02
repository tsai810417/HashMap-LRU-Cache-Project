class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    node = self.first
    while node.next != nil
      return node.val if node.key == key
      node = node.next
    end
    return nil
  end

  def include?(key)
    self.get(key) != nil
  end

  def append(key, val)
    node = Node.new(key, val)

    node.prev = @tail.prev
    node.next = @tail
    node.prev.next = node
    @tail.prev = node
    @count += 1
  end

  def update(key, val)
    node = self.first
    while node.next != nil
      if node.key == key
        target = node
        break
      else
        node = node.next
      end
    end
    if target
      target.val = val
    end
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
