require 'byebug'

input = File.readlines('test_input.txt')

input_columns = input.map.map(&:chomp).map(&:chars).transpose

epsilon_rate = input_columns.map do |column|
  column.count("0") > column.count("1") ? "0" : "1"
end.join.to_i(2)

gamma_rate = input_columns.map do |column|
  column.count("0") < column.count("1") ? "0" : "1"
end.join.to_i(2)

puts epsilon_rate
puts gamma_rate
puts epsilon_rate * gamma_rate

