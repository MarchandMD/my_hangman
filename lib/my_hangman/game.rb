# frozen_string_literal: true

require_relative 'solution'
require_relative 'board'

module Hangman
  class Game
    attr_accessor :solution, :maybetwo, :maybenone

    def initialize
      @solution = Solution.new
    end

    def introduction
      puts "#{solution.value}\n\n"
      puts "(p)lay"
      puts "(i)structions"
    end

    def play
      introduction
      user_choice == "p" ? start_game : display_instructions
    end

    def user_choice(input = nil)
      loop do
        input ||= gets.chomp.downcase
        break if %w[p i].include?(input)

        puts "invalid. (p)lay or (i)nstructions"
        input = nil
      end
      input
    end

    def display_instructions
      # how to play
    end

    def start_game
      # starting the game
      puts'*' * 10
      puts "i want to display the available_letters #{print Board.new.letters}\n\n"
      puts "i want to display the solution: #{solution.value}"
      puts 'i want to prompt the user for a letter'
    end
  end
end

game = Hangman::Game.new
game.play
