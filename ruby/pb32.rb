#!/usr/bin/env ruby
class Triple
  attr_accessor :a,:b
  def initialize(a,b)
    @a = a.to_i
    @b = b.to_i
  end

  def p
    a*b
  end

  def pandigital?
    r = (a.to_s + b.to_s + p.to_s).split('').map(&:to_i).sort == (1..9).to_a
    puts self.to_s if r
    r
  end

  def to_s
    "#{a}x#{b}=#{p}"
  end
end

max = Math.sqrt(1e9-1).to_i
p (1..max).lazy.flat_map{|a| (((10**2.5)/a).floor..((10**4)/a).ceil).map{|b| Triple.new(a,b)}}.select(&:pandigital?).map{|t| t.p}.to_a.uniq.reduce(:+)

