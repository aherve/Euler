#!/usr/bin/env ruby

class Frac
  attr_accessor :n,:d
  def initialize(n,d)
    gcd = n.gcd(d)
    @n = n/gcd
    @d = d/gcd
  end

  def value
    1.0*n/d
  end

  def < f
    self.value < f.value
  end

  def > f
    self.value > f.value
  end

end

def last_frac(f_key,denom)
  Frac.new((f_key.value*denom).floor, denom)
end

d_max = 1_000_000
@f_key = Frac.new(3,7)
f_start = Frac.new(2,5)

p (1..d_max).reduce(f_start) { |found,d|
  f = last_frac(@f_key,d)
  found = (f > found and f < @f_key) ? f : found
}.n
