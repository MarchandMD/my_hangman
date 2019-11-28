# frozen_string_literal: true

module Hangman
  class Solution
    attr_accessor :value

    def initialize(value = 'hangman')
      @value = value
    end

    def hide; end
  end
end
