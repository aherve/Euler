#!/usr/bin/env ruby

def next_n(n)
  r = 0
  while n > 0
    r += (n%10)**2
    n /= 10
  end
  r
end

@h ||= {89 => 89, 1 => 1}

limit = -> x {
  @h[x] ||= limit.(next_n(x))
}

goes_to_89 = -> x { limit.(x) == 89 }

p (1..10_000_000).count(&goes_to_89)
