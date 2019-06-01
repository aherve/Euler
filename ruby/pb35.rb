#!/usr/bin/env ruby
require 'prime'

class Numeric
  def select
    !(0..(s = self.to_s).size - 1)
    .map{|i| (s*2)[i,s.size].to_i}
    .map{|i| Prime.prime? i}
    .include? false
  end
end

puts Prime.take_while{|i| i< 1_000_000}.select(&:select).size
