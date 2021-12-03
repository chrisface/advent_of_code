require 'byebug'

class Solution
  def initialize
    @input = File.readlines('extended_test_input.txt').map(&:chomp)
  end

  def oxygen_generation_rating
    filter_numbers(&method(:most_common_bit)).first.to_i(2)
  end

  def scrubbing_rating
    filter_numbers(&method(:least_common_bit)).first.to_i(2)
  end

  def filter_numbers(numbers = @input, bit_column = 0, &common_bit_finder)
    common_bit = common_bit_finder.call(numbers, bit_column)
    filtered_numbers = numbers.select { |n| n[bit_column] == common_bit }
    return filtered_numbers if filtered_numbers.one?

    filter_numbers(filtered_numbers, bit_column + 1, &common_bit_finder)
  end

  def life_support_rating
    oxygen_generation_rating * scrubbing_rating
  end

  def most_common_bit(numbers = @input, bit_column = 0)
    bit_count = numbers.map(&:chars).transpose[bit_column].tally
    bit_count.fetch("1", 0) >= bit_count.fetch("0", 0) ? "1" : "0"
  end

  def least_common_bit(numbers = @input, bit_column = 0)
    bit_count = numbers.map(&:chars).transpose[bit_column].tally
    bit_count.fetch("0", 0) <= bit_count.fetch("1", 0) ? "0" : "1"
  end
end

puts Solution.new.life_support_rating # 6124992