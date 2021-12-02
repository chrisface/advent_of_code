require 'byebug'

input = File.readlines('extended_test_input.txt').map(&:to_i)

depth_change_windows = input.each_cons(3)

window_depth_changes = depth_change_windows.each_cons(2).map do |window, next_window|
  next_window.sum > window.sum ? :increase : :decrease
end

puts window_depth_changes.count(:increase)

