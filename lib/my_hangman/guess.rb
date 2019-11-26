# frozen_string_literal: false

module MyHangman
  class Guess
    attr_accessor :value

    def initialize(value = "")
      @value = value
    end

    def standardize(input = "")
      input.upcase!
    end

    # def get_guess
    #   input = gets.chomp.upcase!
    # end

  end
end
