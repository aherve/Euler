#!/usr/bin/env ruby

signature = -> x { x.to_s.split('').sort.join }
cube = -> x { x**3}

@imin  = Hash.new
@count = Hash.new(0)

(0..Float::INFINITY).each do |i|
  sig = signature.( c= cube.(i))
  @imin[sig] ||= c
  @count[sig] +=1
  if @count[sig] == 5
    puts "found : #{@imin[sig]}" 
    exit
  end
end
