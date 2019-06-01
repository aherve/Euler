#!/usr/bin/env ruby

require 'prime'
p Prime.take_while{|i| i<2e6}.reduce(:+)
