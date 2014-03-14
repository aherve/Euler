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

  def add(f)
    Frac.new(self.n*f.d + self.d*f.n, self.d*f.d).simplify
  end

  def inv
    Frac.new(d,n).simplify
  end

  def to_s
    "#{n}/#{d}"
  end

end

def convergent(ary)
  @mem ||= Hash.new
  k = ary.map(&:to_s).join(',')
  if ary.size < 2
    @mem[k] ||= ary.first 
  else
    @mem[k] ||= ary.first.add( ( convergent(ary[1..-1])).inv )
  end
end

e_enum = Enumerator.new do |en|
  en << Frac.new(1,1)
  loop do 
    en << Frac.new(2,1)
  end
end

p (1..1000).map{|i| convergent(e_enum.take(i))}.select{|f| f.n.to_s.split('').size > f.d.to_s.split('').size}.size
