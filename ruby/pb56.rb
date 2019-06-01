#!/usr/bin/env ruby
p (0..100).map{|i|
  (0..100).map{|j|
    (i**j).to_s.split('').map{|x| x.to_i}.reduce(:+)
  }
}.flatten.max

