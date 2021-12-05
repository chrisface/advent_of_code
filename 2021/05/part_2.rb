require 'byebug'

input = File.readlines('part_2_input.txt').map(&:chomp)

lines = input.map {|line| line.split(" -> ").map {|coord| coord.split(",").map(&:to_i) } }

points = lines.each_with_object([]) do |(line_start, line_end), occupied_points|
  if line_start[0] == line_end[0]
    y_range = Range.new(*[line_start[1], line_end[1]].sort)
    y_range.each {|y| occupied_points << [line_start[0], y] }

  elsif line_start[1] == line_end[1]
    x_range = Range.new(*[line_start[0], line_end[0]].sort)
    x_range.each {|x| occupied_points << [x, line_start[1]] }
  else
    puts "diagonal"

    y_range = line_start[1]..line_end[1]
    x_range = line_start[0]..line_end[0]

    puts "x range: #{x_range}"
    puts "y range: #{y_range}"

    x_step = x_range.last <=> x_range.first
    y_step = y_range.last <=> y_range.first

    occupied_points.concat line_start[0].step(line_end[0], x_step).zip(
      line_start[1].step(line_end[1], y_step)
    )
  end
  occupied_points
end

puts points.tally.values.count {|v| v > 1 }
