# frozen_string_literal: true

module Hangman
  class Solution
    attr_accessor :value, :obscured

    def initialize(value = 'hangman')
      @value = value.upcase.split('')
      @obscured = @value.map { |x| x ? '_' : nil }
    end
  end
end
