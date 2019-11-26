# frozen_string_literal: true

module MyHangman
  class Player

    attr_accessor :first_iv, :second_iv, :name

    def initialize(name = '')
      @name = name
    end

    def prompt
      # loop do
        puts 'Please enter a single letter: '
        input = gets.chomp
        # while !input.length == 1
          # puts 'invalid selection. Try again: '
          # redo
        # else
          # break
        # end
        # break
      # end
      # input
    end

  end
end
