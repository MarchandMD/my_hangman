# frozen_string_literal: true

require_relative "solution"
require_relative "board"

module Hangman
  class Game
    attr_accessor :solution, :board, :turns

    def initialize
      @solution = Solution.new
      @board = Board.new
      @turns = 0
    end

    def introduction
      puts "#{solution.value}\n\n"
      puts "(p)lay"
      puts "(i)structions"
    end

    def play
      introduction
      user_choice == "p" ? display_board : display_instructions
      take_a_turn
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
      puts "obscured secret word: CURRENTLY REFACTORING THIS"
      puts "You're currently on turn #{turns + 1}"
    end

    def take_a_turn(letter = nil)
      print "Guess a letter: "
      loop do
        letter ||= gets.chomp.upcase
        if letter.length != 1
          puts 'invalid entry. Try again: '
          letter = nil
        elsif board.letters.include?(letter) && solution.value.include?(letter)
          board.remove_letter(board.letters.index(letter))
          solution.update(letter)
          puts display_board
          self.turns += 1
          break 
        else
          puts "that's not what I expected"
          break
        end
      end
      # display_board
    end
  end
end

# game = Hangman::Game.new
# game.play
