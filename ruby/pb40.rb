#!/usr/bin/env ruby

digits = Enumerator.new do |enum|
  i = 0
  loop do 
    i.to_s.split('').map(&:to_i).each do |d|
      enum << d
    end
    i +=1
  end
end

a = digits.take(1_000_000 + 1)
p (1..6).map{|p| a[(10**p).to_i]}.reduce(:*)
