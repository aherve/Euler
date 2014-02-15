#!/usr/bin/env ruby

p (1..1000).map{|i| (i**i)%1e10.to_i}.reduce(:+) % 1e10.to_i
