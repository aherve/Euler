#!/usr/bin/env ruby
#

triangle = []
f = File.open("triangle.txt",'r')
f.each_line do |l|
	triangle << l.split(/ /).map{|i| i.to_i}
end
f.close

(triangle.size-2).downto(0).each do |r|
	n = triangle[r].size
	(0..n-1).each do |i|
		triangle[r][i] += [triangle[r+1][i], triangle[r+1][i+1]].max #1er element
	end
end

puts triangle[0]
