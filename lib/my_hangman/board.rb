# frozen_string_literal: true

require_relative "solution.rb"

module Hangman
  class Board
    attr_accessor :letters

    def initialize(letters = [*("A".."Z")])
      @letters = letters
    end

    def remove_letter(index)
      letters[index] = " "
    end

    def update_dude(bad_guesses)
      hangman = [" ______  ", " |    |  ", " |    -  ", " |   | | ", " |    =  ", " |    |  ", " |   -|- ", " |    |  ", " |   / \\"]
     puts hangman[0..bad_guesses - 1]
    end
  end
end
