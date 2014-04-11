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
    ].compact
  end

  def finished
    i == matrix.size - 1 and j == matrix.size - 1
  end

  def == p
    self.i == p.i and self.j == p.j and self.sum == p.sum
  end

  def ij
    "#{i}.#{j}"
  end
end

m = Matrix.new('./matrix.txt')
p = Path.new(m)
paths = {p.ij => p}

while (final_path = paths.values.select(&:finished)).empty?
  paths.values.flat_map(&:child_paths).each do |new_path|
    if pp = paths[new_path.ij]
      paths[new_path.ij] = [new_path,pp].sort_by(&:sum).first
    else
      paths[new_path.ij] = new_path
    end
  end
end
puts final_path.first.sum
