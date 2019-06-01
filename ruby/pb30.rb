#!/usr/bin/env ruby

# x = sum(di**5), with n digits
# => 10**(n-1) <= x < 10**n and n < sum(di**5) < n.9**5
# sup limit for n : 10**(n-1) > n.9**5 => condition : (n<7)

check = -> x { x == x.to_s.split('').map(&:to_i).map{|i| i**5}.reduce(:+) }
p (2..1e6.to_i).select(&check).reduce(:+)
