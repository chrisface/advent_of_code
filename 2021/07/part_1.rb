require 'byebug'

crab_positions = File.read('part_1_input.txt').split(",").map(&:to_i)

min, max = crab_positions.minmax

crabs_per_position = crab_positions.tally

position_costs = (min..max).each_with_object({}) do |target_position, h|
  position_move_cost = crabs_per_position.map do |current_position, crab_count|
    (target_position - current_position).abs * crab_count
  end.sum
  h[target_position] = position_move_cost
end

puts position_costs.sort_by { |key, value| value }.first


