require 'byebug'

input = File.readlines('test_input.txt').map(&:to_i)

depth_changes = input.each_cons(2).map do |a, b|
  b > a ? :increase : :decrease
end

puts depth_changes.count(:increase)
