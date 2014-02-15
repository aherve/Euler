#!/usr/bin/env ruby

length = lambda {|i|
  @t ||= Hash.new do |h,k|
    h[k] = 1 if k == 1
    h[k] = 1 + h[k.even? ? k/2 : 3*k+1]
  end
  @t[i]
}

p (1..999999).map(&length).max
