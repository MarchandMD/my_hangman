# frozen_string_literal: true

module Hangman
  class Solution
    attr_accessor :value

    def initialize(value = 'hangman')
      @value = value.upcase.split('')
    end

    def update(letter = nil)
      letter
    end
  end
end
