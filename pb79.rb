#!/usr/bin/env ruby

class Edge
  attr_accessor :start, :target
  def initialize(s,t)
    @start = s
    @target = t
  end
  def to_s
    "#{start}->#{target}"
  end
end

@edges = []

File.open("./keylog.txt").each_line do |line|
  ll = line.chomp.split("")
  (0..ll.size-2).each do |i|
    @edges << Edge.new(ll[i],ll[i+1])
  end
end

@edges.uniq!(&:to_s)

l = []
nodes = (@edges.map(&:start) + @edges.map(&:target)).uniq
s = nodes.select{|n| !@edges.map(&:target).include? n}

while !s.empty?
  l << (n = s.pop)
  @edges -= @edges.select{|e| e.start == n}
  s = nodes.select{|n| !@edges.map(&:target).include? n} - l
end

puts l.join
