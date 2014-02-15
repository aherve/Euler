#!/usr/bin/env ruby
#
def pb9
	(1..1000).each do |a|
		(a..1000).each do |b|
			c = 1000 - a - b
			return a*b*c if (a**2 + b**2 == c**2)
		end
	end
end

puts pb9
