# frozen_string_literal: true

module MyHangman
  class Player
    attr_accessor :name

    def initialize(name = '')
      @name = name
    end

    #  && !board.letters.include?(input): to be added later to the conditional statement
    def prompt(input = nil, board = nil)
      puts 'Please enter a single letter: '
      loop do
        input ||= gets.chomp
        if input.length != 1
          puts 'invalid selection. Try again: '
          input = nil
        else
          break
        end
      end
      input
    end
  end
end
