require 'pry'
file = File.open("input.txt")
movements = []
moves = file.read.split("\n")
moves.each do |m|
  nos = m.split(" ")
  no = nos[1].to_i
  from = nos[3].to_i
  to = nos[5].to_i
  movements << [no, from, to]
end


stacks = {
  1 => %w[B Q C],
  2 => %w[R Q W Z],
  3 => %w[B M R L V],
  4 => %w[C Z H V T W],
  5 => %w[D Z H B N V G],
  6 => %w[H N P C J F V Q],
  7 => %w[D G T R W Z S],
  8 => %w[C G M N B W Z P],
  9 => %w[N J B M W Q F P]
}

movements.each do |mo|
    els = stacks[mo[1]].last(mo[0])
    stacks[mo[1]].pop(mo[0])
    els.each { |e| stacks[mo[2]].push(e)}
end

new_stack = {}
stacks.each do |k,v|
  new_stack[k] = v.compact
end

tops = []
new_stack.each do |k,v|
  tops << v.last
end

p tops.join
