require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed = 0
    self.each_with_index do | el, i |
      hashed += el * i
    end
    hashed
  end
end

class String
  def hash
    self.each_byte.to_a.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
