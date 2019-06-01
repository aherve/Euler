#!/usr/bin/env ruby

# 10**(n-1) <= i**n < 10**n
# <=> 10**((n-1)/n) <= i < 10

finf = -> n { 10**( (n-1.0)/n ) }
fsup = -> n { 10 -1 }

possible_ns = (1..Float::INFINITY).lazy.take_while{|n| finf.(n).ceil <= fsup.(n).floor}
p possible_ns.map{|n| (finf.(n).ceil..fsup.(n).floor).size}.reduce(:+)
