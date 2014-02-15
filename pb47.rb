#!/usr/bin/env ruby
require 'prime'

n_distinct_factors = -> n,ary {
  return ary.first if ! ( ary.map{|i| i.prime_division.size == n}.include? false )
}

n_consecutive = 4
n_distinct = 4

puts (1..Float::INFINITY).lazy.map{|i| n_distinct_factors.call(n_distinct,(i..i+n_consecutive - 1))}.reject{|k| k.nil?}.first
