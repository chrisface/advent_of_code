require 'byebug'

fish_ages = File.read('part_1_input.txt').split(",").map(&:to_i)
days = 256
reproduction_maturity = 8
reproduction_interval = 6

fish_age_groups = fish_ages.tally
fish_age_groups.default = 0

puts "Initial State: #{fish_age_groups}"

days.times do |day|
  birthing = fish_age_groups.delete(0) || 0
  fish_age_groups.transform_keys! {|age_group| age_group - 1  }
  fish_age_groups[6] += birthing
  fish_age_groups[8] += birthing
  puts "After #{day+1} days: #{fish_age_groups}"
end

puts "Number of Fish: #{fish_age_groups.values.sum}"

