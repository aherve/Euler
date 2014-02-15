#!/usr/bin/env ruby

class Integer
	def facto
		self <= 1 ? 1 : self*(self-1).facto
	end
end
puts 100.facto.to_s.split(//).map{|i| i.to_i}.inject(:+)
