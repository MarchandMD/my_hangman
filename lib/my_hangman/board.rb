# frozen_string_literal: true

require_relative 'solution.rb'

module MyHangman
  class Board
    attr_accessor :letters, :solution

    def initialize(letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z])
      @letters = letters
      @solution = Solution.new
    end

    def remove_letter(index = nil)
      letters[index] = ' '
    end

    def display_solution(solution = self.solution)
      puts solution.value
    end
  end
end
