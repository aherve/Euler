#!/usr/bin/env ruby

class Integer
  def mirror
    self.to_s.split("").reverse.join.to_i
  end

  def palindrome?
    self == self.mirror
  end

  def next_iter
    self + self.mirror
  end

end

lychrel_order = lambda do |i,known = 0|
  return -1 if known > 50
  n = i.next_iter
  if n.palindrome?
    return known + 1
  else
    return lychrel_order.call(n,known + 1)
  end
end

puts (10..10_000).map(&lychrel_order).select{|o| o<0}.size
