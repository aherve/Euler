#!/usr/bin/env ruby

class Frac 
  attr_accessor :n,:d
  def initialize(n,d)
    gcd = n.gcd(d)
    @n = n/gcd ; @d = d/gcd
  end
  def to_s
    @n == 0 ? "0" : "#{n}/#{d}"
  end

  def eucl_divisor
    f = Frac.new(@n,@d)
    Enumerator.new do |enum|
      loop do 
        div = 10*f.n/f.d
        f = Frac.new(10*f.n - f.d*div,f.d)
        enum << [div.to_s,f.to_s].join("|")
      end
    end
  end
end

div_cycle_length = -> d {
  h = Hash.new
  div = Frac.new(1,d).eucl_divisor
  (0..Float::INFINITY).lazy.each{ |i|
    k = div.next
    if h[k]
      return i - h[k]
    else
      h[k] = i
    end
  }
}

p (1..1000).sort_by(&div_cycle_length).last
