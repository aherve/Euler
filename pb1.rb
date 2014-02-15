#!/usr/bin/env ruby
p (1..999).select{|i| (i%3==0 || i%5==0)}.reduce(:+)
