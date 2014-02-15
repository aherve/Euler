#!/usr/bin/env ruby
res = []
(2..100).each do |a|
	(2..100).each do |b|
		res << a**b
	end
end

puts res.uniq.size
