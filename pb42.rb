#!/usr/bin/env ruby
code = -> x {
  x.downcase.each_char.map{|c| c.ord - 97 + 1}.reduce(:+).to_i
}

is_triangle = -> x {
  (r = 0.5*( Math.sqrt(1+8*x) - 1)) == r.to_i
}

is_valid = -> x { is_triangle.call( code.call( x)) }

puts File.read("./words.txt").gsub('"','').split(",").select(&is_valid).size
