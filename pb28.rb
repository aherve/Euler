#!/usr/bin/env ruby

f = -> x{ x == 0 ? 1 : 4*(2*x+1)**2 - 12*x + f.(x-1) }
p f.(500)
