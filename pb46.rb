#!/usr/bin/env ruby
require 'prime'

#probably not the shortest way, just wanted to play around w/ lazy enumerators and lambdas

odd_composites = Enumerator.new do |enum|
  k = 7 #so the first one is 9
  loop do 
    k +=2
    if k.odd? and !Prime.prime? k
      enum << k
    else
      next
    end
  end
end.lazy

primes_under = Hash.new do |h,k|
  h[k] = Prime.take_while{|p| p <= k}
end

is_not_goldbach = -> x {
  primes_under[x].each do |p|
  return false if (square = Math.sqrt(0.5*(x - p))).to_i == square
  end
return true
}

puts odd_composites.select(&is_not_goldbach).first
