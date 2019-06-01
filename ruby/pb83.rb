#!/usr/bin/env ruby

class Matrix < Array
  def initialize(filename)
    self.replace(
      File.read(filename).split("\n").map do |line|
      line.split(',').map(&:to_i)
      end
    )
  end
end

class Path
  attr_reader :matrix
  attr_accessor :i,:j,:sum
  def initialize(matrix,i=0,j=0,s=0)
    @matrix = matrix
    @i      = i
    @j      = j
    @sum    = s + matrix[i][j]
  end

  def child_paths
    [
      i + 1 < matrix.size ? Path.new(matrix,i+1,j  ,sum) : nil,
      j + 1 < matrix.size ? Path.new(matrix,i  ,j+1,sum) : nil,
      i - 1 >= 0          ? Path.new(matrix,i-1,j  ,sum) : nil,
      j - 1 >= 0          ? Path.new(matrix,i  ,j-1,sum) : nil,
    ].compact
  end

  def finished
    j == matrix.size - 1 and i == matrix.size - 1
  end

  def == p
    self.i == p.i and self.j == p.j and self.sum == p.sum
  end

  def ij
    "#{i}.#{j}"
  end

  def to_s
    "#{i}.#{j} => #{sum}"
  end
end

m = Matrix.new('./matrix83.txt')
p = Path.new(m)
paths = (0..0).map{|i| p = Path.new(m,i) ; {p.ij => p}}.reduce(:merge)

while (final = paths.values.select(&:finished)).empty?
  child = paths.values.flat_map(&:child_paths).reject{|p| (s=paths[p.ij]) and s.sum <= p.sum}.sort_by(&:sum).first
  paths[child.ij] = child
  if rand(100) == 1
    p paths.values.sort_by{|pp| (m.size - 1 - p.i)**2 + (m.size - 1 - p.j)**2}.last.ij
  end
end

p final.map(&:sum)
