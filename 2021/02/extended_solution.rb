require 'byebug'

input = File.readlines('extended_test_input.txt').map {|i| [i.split.first, i.split.last.to_i] }

position = { h: 0, d: 0, aim: 0 }

final_position = input.reduce(position) do |position, (direction, distance)|
  case direction
  when "forward"
    position[:h] += distance
    position[:d] += (position[:aim] * distance)
  when "down"
    position[:aim] += distance
  when "up"
    position[:aim] -= distance
  end
  puts position
  position
end

puts final_position[:h] * final_position[:d]
