# frozen_string_literal: true

require_relative "solution"
require_relative "board"

module Hangman
  class Game
    attr_accessor :solution, :board, :turns, :letter, :words

    def initialize
      @solution = ""
      @board = Board.new
      @turns = 0
      @letter = ""
      @words = %w[cow hangman notebook lamp humidifier library bamboo tree bookshelf]
    end

    def introduction
      puts "\nH A N G M A N\n\n"
      gallows
      puts "(p)lay"
      puts "(i)structions\n\n"
    end

    def play
      self.solution = Solution.new(words.sample)
      introduction
      user_choice == "p" ? display_board : display_instructions
      while board.letters.length.positive?
        take_a_turn
        board.remove_letter(board.letters.index(letter))
        update_solution(solution.value, solution.obscured, letter)
        if solution.obscured.any?("_")
          display_board
        else
          puts "obscured secret word: #{solution.obscured.join(" ")}"
          puts "YOU WIN!"
          break
        end
      end
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
      puts "you play hangman"
    end

    def display_board
      puts "*" * 10 + "\n"
      puts "Remaining Letters: "
      puts board.letters.join(" ") + "\n\n"
      gallows
      puts "obscured secret word: #{solution.obscured.join(" ")}"
      puts "You're currently on turn #{turns + 1}"
    end

    def take_a_turn(input = nil)
      print "Guess a letter: "
      loop do
        input ||= gets.chomp.upcase
        input.length != 1 || !board.letters.include?(input) ? input = nil : break
        puts "invalid entry. Try again: "
      end
      @turns += 1
      self.letter = input
    end

    def update_solution(arr1, arr2, letter = nil)
      arr1.each_with_index do |x, i|
        x == letter ? arr2[i] = x : nil
      end
    end

    def gallows
      puts " _______ "
      puts " |     | "
      puts " |       "
      puts " |       "
      puts " |       "
      puts " |       "
      puts " |       "
      puts " |       "
      puts " |       "
      puts " |       "
      puts " ------- "
    end
  end
end
