# frozen_string_literal: true

module Hangman
  class Solution
    attr_accessor :value

    def initialize(value = 'HANGMAN')
      @value = value
    end

    def add_a_letter(letter = nil)
      puts letter
    end
  end
end
