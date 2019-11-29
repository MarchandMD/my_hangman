# frozen_string_literal: true

module Hangman
  class Solution
    attr_accessor :value, :obscured

    def initialize(value = 'hangman')
      @value = value.upcase.split('')
      @obscured = '_ ' * value.length
    end

    # def obscured
    #   '_ ' * value.length
    # end
    def reveal(input = nil)
      if value.include?(input)
        if value.index(input).zero?
          obscured[value.index(input)] = input
        else
          obscured[value.index(input)*2] = input
        end
      end
      obscured
    end
  end
end
