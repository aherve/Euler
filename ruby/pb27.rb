#!/usr/bin/env ruby
#
#list of prime numbers under 1000:
@prems = [2]
def isprime(num)
	return true if @prems.include?(num)
	return false if num < 2
	(2..(Math.sqrt(num).floor+1)).each do |i|
		return false if num % i == 0
	end
	@prems << num
	return true
end

(2..1000).map{|i| isprime(i)} # renseigne les premiers < 1000
@lastb = @prems.last

def quad(a,b)
	en = Enumerator.new do |e|
		n=0
		while true
			e.yield n*n + a*n +b
			n+=1
		end
	end
end

def length(a,b)
	enum = quad(a,b)
	t = enum.next
	c = isprime(t) ? 1 : 0
	while isprime(t)
		t = enum.next
		c +=1
	end
	return c
end

lmax = 0
(-1000..1000).each do |a|
	(2..@lastb).each do |b|
		l = length(a,b)
		if l > lmax
			lmax = l
			amax = a
			bmax = b
			puts "found new value : #{a},#{b} -> #{lmax}"
		end
	end
end
