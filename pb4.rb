#!/usr/bin/env ruby

ispalin = lambda{ |i| i.to_s == i.to_s.reverse}

p (100..999).map{|i|
  (i..999).map{|j| 
    i*j
  }
}.flatten.select(&ispalin).max
