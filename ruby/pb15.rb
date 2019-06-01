#!/usr/bin/env ruby
#
class Integer
	def !
		return self <= 1 ? 1 : self*((self-1).!)
	end
end
def nbroutes(n)
	return ((2*n).!*(n.!)**(-2)).to_i
end

puts nbroutes(20)
