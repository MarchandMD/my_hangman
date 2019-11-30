# frozen_string_literal: true

require_relative "solution"
require_relative "board"

module Hangman
  class Game
    attr_accessor :solution, :board, :turns, :letter

    def initialize
      @solution = Solution.new
      @board = Board.new
      @turns = 0
      @letter = ""
    end

    def introduction
      puts "#{solution.value.join}\n\n"
      puts "(p)lay"
      puts "(i)structions"
    end

    def play
      introduction
      user_choice == "p" ? display_board : display_instructions
      while board.letters.length.positive?
        take_a_turn
        board.remove_letter(board.letters.index(letter))
        update_solution(solution.value, solution.obscured, letter)
        if solution.obscured.any?('_')
          display_board
        else
          puts "YOU WIN!"
          break
        end
      end
      puts "#{solution.value.join}"
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

    def display_board
      # starting the game
      # obscured_secret_word = board.hide(solution.value)
      puts "*" * 10 + "\n\n"
      puts board.letters.join(" ") + "\n\n"
      puts "secret word: #{solution.value}"
      puts "obscured secret word: #{solution.obscured.join(' ')}"
      puts "You're currently on turn #{turns + 1}"
    end

    def take_a_turn(input = nil)
      print "Guess a letter: "
      loop do
        input ||= gets.chomp.upcase
        input.length != 1 ? input = nil : break
        puts "invalid entry. Try again: "
      end
      @turns += 1
      self.letter = input
    end

    def update_solution(arr_1, arr_2, letter = nil)
      arr_1.each_with_index do |x, i|
        x == letter ? arr_2[i] = x : nil
      end
    end

  end
end

game = Hangman::Game.new
game.play
