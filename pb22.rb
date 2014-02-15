#!/usr/bin/env ruby

names = File.open("./names.txt").map { |line|
  line.split(',')
}.flatten.map{|n| n[1..n.size-2]}.sort

class String
  def worth
    self.split('').map{|c| 1+c.ord - 'A'.ord }.map(&:to_i).reduce(:+)
  end
end

res = 0
(0..names.size-1).each do |i|
  res += names[i].worth*(i+1)
end

puts res
