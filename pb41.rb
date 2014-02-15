#!/usr/bin/env ruby
require 'prime'


puts Prime.lazy.take_while{|i| i < 987654321 + 1}.select{|i|
  if (a = i.to_s.split("").map(&:to_i).sort) == (1..a.max).to_a
    puts i
    true
  end
}.to_a.last
