# frozen_string_literal: true

module Hangman
  class Player
    attr_accessor :name

    def initialize(name = "")
      @name = name
    end

    #  && !board.letters.include?(input): to be added later to the conditional statement
    def prompt(input = nil, _board = nil)
      puts "Please enter a single letter: "
      loop do
        input ||= gets.chomp
        break unless input.length != 1

        puts 'invalid selection. Try again: '
        input = nil
      end
      input
    end
  end
end
