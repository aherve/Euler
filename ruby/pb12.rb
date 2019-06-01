#!/usr/bin/env ruby

class Integer
	def triangle
		self*(self+1)/2
	end

	def primefactors
		n = self
		res = Hash.new(0)
		(2..Math.sqrt(self).floor).to_a.each do |i|
			while n%i == 0
				n = n/i
				res[i] +=1
			end
		end
		prod = res.each.inject(1){|r,i| r *=i[0]**i[1]}
		res[self/prod] +=1 unless prod == self
		return res
	end

	def factortriangle
		a = self.primefactors
		(self+1).primefactors.each do |f|
			a[f[0]] += f[1]
		end
		a[2] -=1
		a.delete(2) if a[2] == 0
		return a
	end

	def factorcount
		self.factortriangle.each.inject(1){|r,f| r*= f[1]+1}
	end
end

n=1
k = n.factorcount
while k < 500
	puts "#{n.triangle} has #{k} factors"
	n+=1
	k = n.factorcount
end

puts "#{n.triangle} has #{k} factors"

