require 'byebug'

input = File.read('part_1_input.txt').split("\n\n")

random_numbers = input.first.split(",").map(&:to_i)
boards_raw = input[1..]


Cell = Struct.new(:number, :checked, keyword_init: true)

boards = boards_raw.map do |board_raw|
  board_raw.split("\n").map(&:split).map { |row| row.map {|number| Cell.new(number: number.to_i, checked: false) } }
end


def winning_board?(board)
  (board + board.transpose).any? { |r_or_c| r_or_c.all? {|c| c.checked } }
end

winners = []

random_numbers.each do |random_number|
  boards.each_with_index do |board, board_index|
    board.each do |row|
      index = row.find_index{ |row| row[:number] == random_number }

      next if winners.any? {|w| w[:board_index] == board_index }

      unless index.nil?
        puts "Matched #{random_number} on board #{board_index}"
        row[index].checked = true
        if winning_board?(board) && !winners.any? {|w| w[:board_index] == board_index }
          winners << {board_index: board_index, winning_number: random_number }
        end
      end
    end
  end
end

puts winners

winning_board = boards[winners.first[:board_index]]
winning_number = winners.first[:winning_number]

score = winning_board.flatten.select{ |c| c.checked == false }.map(&:number).reduce(&:+) * winning_number
puts score