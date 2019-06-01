#!/usr/bin/env ruby
#

def sum_square(i)
	(1..i).to_a.reduce(0){|r,i| r+=i}**2
end

def square_sum(i)
	(1..i).to_a.reduce(0){|r,i| r+=i**2}
end

n = 100
puts sum_square(n)-square_sum(n)  
