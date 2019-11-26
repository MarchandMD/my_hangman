# frozen_string_literal: true

module MyHangman
  class Player
    attr_accessor :first_iv, :second_iv, :name

    def initialize(name = "")
      @name = name
    end

    def prompt(input = nil)
      puts "Please enter a single letter: "
      loop do
        input ||= gets.chomp
        if input.length != 1
          puts "invalid selection. Try again: "
          input = nil
        else
          break
        end
      end
      input
    end
  end
end
