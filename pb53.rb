#!/usr/bin/env ruby

#fast factorial
def facto(i)
  @facto ||= Hash.new do |h,k|
    h[k] = if k > 1
             k*h[k-1]
           else
             1
           end
  end
  @facto[i]
end

def valid_for_n(n,max)
  enum = Enumerator.new do |enum|
    r = 0
    check = lambda do |r|
      facto(r)*facto(n-r)*max < facto(n)
    end
    r+=1 while check.call(r) == false
    while check.call(r) == true
      enum << r
      r +=1
    end
  end
  enum.reduce(0){|r,k| r+=1}
end

max = 1e6
puts (23..100).map{|x| valid_for_n(x,max)}.reduce(:+)
