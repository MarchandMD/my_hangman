# frozen_string_literal: true

require_relative 'solution'

module Hangman
  class Game
    attr_accessor :solution, :maybetwo, :maybenone

    def initialize
      @solution = Solution.new
    end

    def introduction
      puts "#{solution.value}\n\n"
      puts '(p)lay'
      puts '(i)structions'
    end

    def play
      introduction
      user_choice
    end

    def user_choice(input = nil)
      input
    end



  end
end
