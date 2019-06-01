#!/usr/bin/env ruby

class Frac
  # n/d
  attr_accessor :n,:d

  def initialize(n,d)
    @n = n
    @d = d
    raise "Cannot divide per 0" if d == 0
  end

  def simplify
    gcd = n.gcd(d)
    Frac.new(n/gcd, d/gcd)
  end

  def value
    1.0*n/d
  end

  def to_s
    "#{n}/#{d}"
  end

  def add(f)
    Frac.new(self.n*f.d + self.d*f.n, self.d*f.d).simplify
  end

  def inv
    Frac.new(d,n).simplify
  end

end

def convergent(ary)
  return ary.first if ary.size < 2
  return ary.first.add( ( convergent(ary[1..-1])).inv )
end

e_enum = Enumerator.new do |en|
  i = 1
  en << Frac.new(2,1)
  loop do 
    en << Frac.new(1,1)
    en << Frac.new(2*i,1)
    en << Frac.new(1,1)
    i+=1
  end
end

p convergent(e_enum.take(100)).n.to_s.split('').map(&:to_i).reduce(:+)
