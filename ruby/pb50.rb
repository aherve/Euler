#!/usr/bin/env ruby
require 'prime'

# valid if the sum is prime
valid = lambda do |array|
  Prime.prime? array.reduce(:+)
end

# generate all consecutives integers of size <size>
def consecutives(size)
  Enumerator.new do |enum|
    ps = Prime.lazy
    a = Prime.take(size)
    size.times{ps.next}
    loop do 
      enum << a.dup
      ( a << ps.next ).shift
    end
  end
end

# the sum of n consecutive integers is greater than the sum of first n integers
def sup_limit(max)
  (1..Float::INFINITY).lazy.map{|i| [i,Prime.take(i).reduce(:+)]}.detect{|i,sum| sum >= max}.first
end

valid_consecutives = lambda do |size,max|
  consecutives(size).take_while{|a| a.reduce(:+) < max}.select(&valid)
end

under = lambda do |max|
  sup_limit(max).downto 2 do |size|
    r = (v = valid_consecutives.call(size,max)).sort_by{|a| a.size}.last
    return [r.size, r.reduce(:+)] if r
  end
end

p under.call 1e7
