# frozen_string_literal: true

module MyHangman
  class Solution
    attr_accessor :value

    def initialize(value = 'hangman')
      @value = value
    end

    def hide; end
  end
end
