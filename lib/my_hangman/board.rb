# frozen_string_literal: true

require_relative "solution.rb"

module Hangman
  class Board
    attr_accessor :letters, :solution, :hidden_solution

    def initialize(letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z])
      @letters = letters
      @solution = Solution.new
      @hidden_solution = hide(solution.value)
    end

    def hide(solution = nil)
      "_ " * solution.length
    end

    def remove_letter(index = nil)
      letters[index] = " "
    end
  end
end
