# frozen_string_literal: false

module Hangman
  class Letter
    attr_accessor :value

    def initialize(value = '')
      @value = value
    end
  end
end
