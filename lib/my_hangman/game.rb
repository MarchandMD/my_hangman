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
      puts "\n\n(p)lay"
      puts "(i)structions\n\n"
    end

    def play
      self.solution = Solution.new(words.sample.chomp)
      introduction
      user_choice == "p" ? display_board : display_instructions
      while bad_guess < 9
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
      puts bad_guess == 9 ? "you lose" : nil
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
      bad_guess == 0 ? nil : board.update_dude(bad_guess)
      puts "\n\n\nobscured secret word: #{solution.obscured.join(" ")}\n\n"
      puts "You're currently on turn #{turns + 1}"
    end

    # option to save goes here in this method....
    def take_a_turn(input = nil)
      # puts "want to save the game? (y/n)"
      # loop do
      #   save = gets.chomp.downcase
      #   if save == 'y'
      #     puts "i'm going to save this game"
      #     break
      #   else
      #     puts "not saving"
      #     break
      #   end
      # end
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
      hangman = [" ______  "," |    |  "," |    -  ", " |   | | ", " |    =  ", " |    |  ", " |   -|- ", " |    |  ", " |   / \\"]
      puts "#{hangman[0]}"
      puts "#{hangman[1]}"
      puts "#{hangman[2]}"
      puts "#{hangman[3]}"
      puts "#{hangman[4]}"
      puts "#{hangman[5]}"
      puts "#{hangman[6]}"
      puts "#{hangman[7]}"
      puts "#{hangman[8]}"
    end

    def update_gallows(letter = nil)
      if !solution.value.include?(letter)
        # board.update_dude(bad_guess)
        self.bad_guess += 1
      end 
      return "'#{letter}' is not in the solution; That is now #{bad_guess} bad guesses, and the dude shoud be updated" unless solution.value.include?(letter)
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
