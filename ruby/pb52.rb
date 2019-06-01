#!/usr/bin/env ruby

require 'set'
def to_set x
  Set.new(x.to_s.split(""))
end

same_digits = lambda do |x|
  to_set(2*x) == to_set(3*x) and to_set(2*x) == to_set(4*x) and to_set(2*x) == to_set(5*x) and to_set(2*x) == to_set(6*x)
end

p (1..Float::INFINITY).lazy.select(&same_digits).next
