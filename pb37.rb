#!/usr/bin/env ruby
require 'prime'

primes = -> x { !x.map{|i| Prime.prime? i }.include? false }
truncs = -> x { 
  (0..(l = (s = x.to_s).size - 1)).flat_map{|i|
  [
    (s)[0..i].to_i,
    (s)[i..l].to_i,
  ]
}
}
valid = -> x { x >= 10 and primes.call(truncs.call(x)) }

puts Prime.lazy.select(&valid).first(11).reduce(:+)
