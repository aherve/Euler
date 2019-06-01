#!/usr/bin/env ruby

@coins = [1,2,5,10,20,50,100,200].sort.reverse

def nb_of_comb(tot,stage=-1)
  return 1 if tot == 0 
  return 0 if stage == @coins.size - 1
  next_coin = @coins[stage+1]
  (0..tot/next_coin).map{|i|
    nb_of_comb(tot - next_coin*i, stage+1)
  }.reduce(:+)
end

p nb_of_comb(200)
