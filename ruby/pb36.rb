#!/usr/bin/env ruby

class String
  def pal?
    self == self.reverse
  end
end

class Numeric
  def pal?
    self.to_s.pal? and self.to_s(2).pal?
  end
end

p (1..1e6.to_i).select(&:pal?).reduce(:+)
