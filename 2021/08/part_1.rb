require 'byebug'
require 'set'

input = File.readlines('part_1_input.txt').map { |line| line.split("|").map(&:strip).map {|t| t.split.map(&:chars).map(&:to_set)} }

all_readings = input.map do |samples, readings_segments|
  numbers = {}

  numbers[1] = samples.find {|s| s.length == 2 }
  numbers[4] = samples.find {|s| s.length == 4 }
  numbers[7] = samples.find {|s| s.length == 3 }
  numbers[8] = samples.find {|s| s.length == 7 }
  numbers[9] = samples.find {|s| s.length == 6 && numbers[4].subset?(s) }
  numbers[6] = samples.find {|s| s.length == 6 && (numbers[4] - numbers[1]).subset?(s) && s != numbers[9] }
  numbers[0] = samples.find {|s| s.length == 6 && s != numbers[9] && s != numbers[6] }
  numbers[5] = samples.find {|s| s.length == 5 && s.subset?(numbers[6]) }
  numbers[3] = samples.find {|s| s.length == 5 && s.subset?(numbers[9]) && s != numbers[5] }
  numbers[2] = samples.find {|s| s.length == 5 && s != numbers[3] && s != numbers[5] }

  readings_segments.map {|reading| numbers.find {|(_, segments)| segments == reading }.first }
end

part_1_answer = all_readings.flatten.tally.slice(1,4,7,8).values.sum
puts part_1_answer

part_2_answer = all_readings.map(&:join).map(&:to_i).sum
puts part_2_answer