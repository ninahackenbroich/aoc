require 'pry'
file = File.open("input.txt")
pairs = file.read.gsub('-', '..').split(/[\n ,]+/)

ranges = []
pairs.map do |pa|
  p split = pa.split("..")
  ranges << (split[0].to_i..split[-1].to_i).to_a
end

equals = 0
ranges.each_slice(2) do |sli|
  combi = sli[0] + sli[1]
  unless combi.uniq.size == combi.size
    equals += 1
  end
end

p equals


