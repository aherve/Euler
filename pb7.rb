#!/usr/bin/env ruby
#

class Integer
	def isprime?
		(2..Math.sqrt(self).floor).to_a.each do |i|
			return false if (self%i == 0)
		end
		return true
	end
end

enum = Enumerator.new do |yielder|
	i = 2
	loop do
		yielder.yield i
		i+=1
		while (i.isprime? == false) do
			i+=1
		end
	end
end

10000.times do
	enum.next
end

puts enum.next
