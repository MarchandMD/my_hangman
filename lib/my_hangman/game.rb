# frozen_string_literal: true

require_relative "solution"
require_relative "board"

module Hangman
  class Game
    attr_accessor :solution, :board, :turns, :letter, :words, :bad_guess

    # replace the @words Array with a reference to an external file holding multiple words
    def initialize
      @solution = ""
      @board = Board.new
      @turns = 0
      @letter = ""
      @words = huge_dictionary
      @bad_guess = 0
    end

    def introduction
      puts "\nH A N G M A N\n\n"
      gallows
      puts "(p)lay"
      puts "(i)structions\n\n"
    end

    def play
      self.solution = Solution.new(words.sample.chomp)
      introduction
      user_choice == "p" ? display_board : display_instructions
      while board.letters.length.positive?
        take_a_turn
        board.remove_letter(board.letters.index(letter))
        # if the letter is in the solution, #update_solution
        # if the letter is NOT in the solution, #update_gallows
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
      puts "*" * 40 + "\n"
      puts letter != "" ? "You guessed: '#{letter}'" : nil
      puts letter != "" ? update_gallows(letter) : nil
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
        # input == solution.value.join('') ? that's it! : update_gallows
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
      hangman = [" |    -  ", " |   | | ", " |    =  ", " |    |  ", " |   -|- ", " |    |  ", " |   / \\"]
      puts " ______  "
      puts " |    |  "
      puts "#{hangman[0]}"
      puts "#{hangman[1]}"
      puts "#{hangman[2]}"
      puts "#{hangman[3]}"
      puts "#{hangman[4]}"
      puts "#{hangman[5]}"
      puts "#{hangman[6]}"
      puts " |       "
      puts " ------- "
    end

    def update_gallows(letter = nil)
      self.bad_guess += 1
      return "'#{letter}' is not in the solution; That is now #{bad_guess} bad guesses" unless solution.value.include?(letter)
    end

    def huge_dictionary
      dictionary = File.open('dictionary.txt', 'r')
      all_words = []
      dictionary.readlines.each do |word|
        all_words << word
      end
      all_words
    end

  end
end
