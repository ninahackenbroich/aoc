require 'pry'
file = File.open("input.txt")
bags = file.read.split("\n")

# p bags

letters = ("a".."z").to_a
letters << ("A".."Z").to_a
numbers = (1..52).to_a

# p letters.flatten
# p numbers
h = {}

letters.flatten.zip(numbers) { |a,b| h[a] = b } 

# p h
sum = 0

bags.each_slice(3) do |str| 
  # p str
   common = (str[0].chars & str[1].chars & str[2].chars  ).join
  #  p common
  # s = [str[0, str.size/2], str[str.size/2..-1]]
  # # p s
  # common = (s[0].chars & s[1].chars).join
  # # p common
  sum += h[common]
end

p sum