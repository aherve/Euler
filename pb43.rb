#!/usr/bin/env ruby

atonum = -> ary{ ary.reduce(0){|r,x| x+10*r} }

valid = -> ary {
  return false unless atonum.(ary[1..3]) % 2 == 0
  return false unless atonum.(ary[2..4]) % 3 == 0
  return false unless atonum.(ary[3..5]) % 5 == 0
  return false unless atonum.(ary[4..6]) % 7 == 0
  return false unless atonum.(ary[5..7]) % 11 == 0
  return false unless atonum.(ary[6..8]) % 13 == 0
  return false unless atonum.(ary[7..9]) % 17 == 0
  return true
}
p (0..9).to_a.permutation.select(&valid).map(&atonum).reduce(:+)
