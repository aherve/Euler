#!/usr/bin/env ruby
#
fibo = Hash.new{|f,n| f[n] = n < 2 ? n : fibo[n-1] + fibo[n-2]}
p (1..Float::INFINITY).lazy.take_while{|i| fibo[i] < 4e6}.map{|i| fibo[i]}.select(&:even?).reduce(:+)
