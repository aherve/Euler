#!/usr/bin/env ruby
@input = File.read('./cipher1.txt').chomp.split(",").map(&:to_i).map(&:chr).join
def key_gen(key)
  Enumerator.new do |enum|
    i = 0
    loop do 
      enum << key[i]
      i = (i+1)%key.size
    end
  end
end
class String
  def decrypt(key)
    k = key_gen(key)
    ns = self.split('').map{|c| c.ord ^ k.next.ord}
    if ns.min >= 32 and ns.max <= 122
      ns.map(&:chr).join
    else
      nil
    end
  end
end

#used this to find the key
#letters = ('a'..'z')
#letters.each do |i|
#  letters.each do |j|
#    letters.each do |k|
#      key = i+j+k
#      if d = @input.decrypt(key)
#        p "#{key}\t#{d}"
#      end
#    end
#  end
#end

p @input.decrypt('god').split('').map(&:ord).reduce(:+)
