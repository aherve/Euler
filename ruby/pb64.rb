#!/usr/bin/env ruby
require 'prime'

class Frac
  # x = (a + sqrt(b))/c
  attr_accessor :a, :b, :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def inv
    Frac.new(-1*a*c, b*c*c, (b - (a**2))).simplify
  end

  def add(i)
    Frac.new(a + (c*i), b, c).simplify
  end

  def sub(i)
    add(-i)
  end

  def value
    (a + Math.sqrt(b))*1.0/c
  end

  def floor
    value.floor
  end

  def to_s
    "(#{a} + sqrt(#{b})) / #{c}"
  end

  def simplify

    #puts "---"
    contains_powers = b.prime_division.select{|x,p| p > 1}.map{|x,p| x**(p/2)}.reduce(1){|x,r| r *=x}.round
    #puts "power = #{contains_powers}"
    gcd = a.gcd(contains_powers).gcd(c)
    #puts "gcd = #{gcd}"

    r = Frac.new(
      a/gcd,
      b/(gcd**2),
      c/gcd
    )

    #puts "debug : #{self} => #{r}"
    #r
  end

  def coefs_sequence
    Enumerator.new do |enum|
      i = self.dup
      loop do 
        coef,res = [i.floor, i.sub(i.floor).inv]
        enum << [coef,res]
        i = res
      end
    end
  end

  def == (x)
    a == x.a and b == x.b and c == x.c
  end

  def cycle_length
    a = []
    coefs_sequence.each_with_index do |ary,i|
      f = ary.first
      res = ary.last
      unless (loop_index = a.index{|x| x.first == f and x.last == res}).nil?
        return i - loop_index
      end
      a << [f,res]
    end
  end

end

has_irrational_sqrt = -> x {
  x.prime_division.map(&:last).select{|p| p.odd?}.size > 0
}
p (2..10_000).select(&has_irrational_sqrt).map{|i| Frac.new(0,i,1).cycle_length}.select{|l| l.odd?}.size
