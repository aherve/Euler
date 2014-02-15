#!/usr/bin/env ruby
h = Hash.new(0)
max = 1_000
(1..max).each do |i|
  (i..max).each do |j|
    if (k = Math.sqrt(i**2 + j**2)) == k.to_i and i+j+k < 1000
      h[i+j+k.to_i] += 1
    end
  end
end

puts h.sort_by{|k,v| v}.last.first
