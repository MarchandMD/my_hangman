# frozen_string_literal: true

require_relative "solution.rb"

module Hangman
  class Board
    attr_accessor :letters

    def initialize(letters = [*('A'..'Z')])
      @letters = letters
    end

    def remove_letter(index = nil)
      letters[index] = " "
    end
  end
end
