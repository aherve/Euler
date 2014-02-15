#!/usr/bin/env ruby
require 'prime'
p 600851475143.prime_division.map(&:first).max
