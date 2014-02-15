#!/usr/bin/env ruby
#
# 1: find sum of abundant numbers

nmax = 28123
@abu = []

class Integer
	def abundant?
		r = 0
		(1..self-1).each do |i|
			r += self%i == 0 ? i : 0
			return true if r > self
		end
		return false
	end
end

puts "looking for abundant numbers..."
(1..nmax).each do |i|
	@abu << i if i.abundant?
end
puts "...done. #{@abu.size} numbers found"


puts "generating summable numbers"
with_sum = @abu.combination(2).to_a.map{|i| i[0] + i[1]}
#combination ne prend pas en compte les doublons
@abu.each do |a|
	with_sum << 2*a
end

puts "generating not summable numbers"
without_sum = (1..nmax).to_a - with_sum

puts "rendering result"
puts without_sum.inject(0){|r,i| r+=i}
