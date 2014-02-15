#!/usr/bin/env ruby
e = (0..9).to_a.permutation(10)
1000000.times{ @k = e.next}

puts @k.join
