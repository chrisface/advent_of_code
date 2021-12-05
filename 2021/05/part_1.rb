require 'byebug'

input = File.readlines('part_1_input.txt').map(&:chomp)

lines = input.map {|line| line.split(" -> ").map {|coord| coord.split(",").map(&:to_i) } }

points = lines.each_with_object([]) do |(line_start, line_end), occuped_points|
  if line_start[0] == line_end[0]
    y_range = Range.new(*[line_start[1], line_end[1]].sort)
    y_range.each {|y| occuped_points << [line_start[0], y] }

  elsif line_start[1] == line_end[1]
    x_range = Range.new(*[line_start[0], line_end[0]].sort)
    x_range.each {|x| occuped_points << [x, line_start[1]] }
  else
    # puts "diagonal"
  end
  occuped_points
end

puts points.tally.count{|(k,v)| v > 1 }