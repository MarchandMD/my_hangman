# frozen_string_literal: true

require "yaml"
require_relative "solution"
require_relative "board"

module Hangman
  class Game
    attr_accessor :solution, :board, :turns, :letter, :words, :bad_guess

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
      puts "\n\n(p)lay new game\n"
      puts "(l)oad saved game\n"
      puts "(i)structions\n\n"
    end

    def play_load_or_instruct
      case user_choice
      when "p"
        self.solution = Solution.new(words.sample.chomp)
        display_board
        play
      when "l"
        load_game
        display_board
        play
      when "i"
        display_instructions
        self.solution = Solution.new(words.sample.chomp)
        play
      end
    end

    def play
      while bad_guess < 9
        take_a_turn
        board.remove_letter(board.letters.index(letter))
        update_solution(solution.value, solution.obscured, letter)
        if solution.obscured.any?("_") && bad_guess != 9
          display_board
        else
          puts "obscured secret word: #{solution.obscured.join(" ")}"
          puts "YOU WIN!"
          break
        end
        puts bad_guess == 9 ? "you lose :( The secret word was: #{solution.value.join}" : nil
      end
    end

    def user_choice(input = nil)
      loop do
        input ||= gets.chomp.downcase
        break if %w[p i l].include?(input)

        puts "invalid. (p)lay or (i)nstructions"
        input = nil
      end
      input
    end

    def display_instructions
      puts "you play hangman"
    end

    def load_game
      puts "you pushed L"
      loaded_data = YAML.load_stream File.read("saved_game.yaml")
      self.solution = Solution.new(loaded_data[0].value.join)
      self.solution.obscured = loaded_data[0].obscured
      self.board = loaded_data[1]
      self.turns = loaded_data[2]
      self.bad_guess = loaded_data[3]
    end

    def display_board
      puts "*" * 40 + "\n"
      puts letter != "" ? update_gallows(letter) : nil
      puts "Remaining Letters: "
      puts board.letters.join(" ") + "\n\n"
      bad_guess == 0 ? nil : board.update_dude(bad_guess)
      puts letter != "" ? "\n\n\nYou guessed: '#{letter}'" : nil
      puts "\nobscured secret word: #{solution.obscured.join(" ")}\n\n"
      puts "You're currently on turn #{turns + 1}"
    end

    # use the commented code to develop a save_game method
    def take_a_turn(input = nil)
      print "Guess a letter: "
      loop do
        input ||= gets.chomp.upcase
        if input == "SAVE"
          save_game
          puts "GAME SAVED!"
          break
        elsif input.length != 1 || !board.letters.include?(input)
          puts "invalid entry. Try again: "
          input = nil
        else
          @turns += 1
          self.letter = input
          break
        end
      end
    end

    def update_solution(arr1, arr2, letter = nil)
      arr1.each_with_index do |x, i|
        x == letter ? arr2[i] = x : nil
      end
    end

    def gallows
      hangman = [" ______  ", " |    |  ", " |    -  ", " |   | | ", " |    =  ", " |    |  ", " |   -|- ", " |    |  ", " |   / \\"]
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
      dictionary = File.open("dictionary.txt", "r")
      all_words = []
      dictionary.readlines.each do |word|
        all_words << word
      end
      all_words
    end

    def save_game
      saved_file = File.new("saved_game.yaml", "w+")
      game_data = [solution, board, turns, bad_guess]
      game_data.each do |game_var|
        saved_file.puts YAML.dump(game_var) + "\n"
      end
      saved_file.close
    end
  end
end
