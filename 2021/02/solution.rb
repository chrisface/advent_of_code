require 'byebug'

input = File.readlines('test_input.txt').map {|i| [i.split.first, i.split.last.to_i] }

position = { h: 0, d: 0 }

final_position = input.reduce(position) do |position, (direction, distance)|
  case direction
  when "forward"
    position[:h] += distance
  when "down"
    position[:d] += distance
  when "up"
    position[:d] -= distance
  end
  puts position
  position
end

puts final_position[:h] * final_position[:d]
