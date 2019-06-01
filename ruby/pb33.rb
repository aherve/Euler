#!/usr/bin/env ruby

n,d= (1000...9999).map{|i| i.to_s.split('').map(&:to_i)}
.reject{|a,b,c,d| b == 0 or c == 0 or a >= c}
.select{|a,b,c,d| (10.0*a + b).to_f/(10*b + c) == a.to_f/c}
.map{|a,b,c,d| [a,c]}
.uniq
.reduce([1,1]){|r,a| r[0] *= a.first ; r[1] *= a.last ;r}

p d/d.gcd(n)
