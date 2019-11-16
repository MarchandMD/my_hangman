# frozen_string_literal: true

module MyHangman
  class Board
    attr_accessor :letters

    def initialize(letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z])
      @letters = letters
    end

    def available_letters
      print "#{@letters.join(' ')}\n\n"
      puts 'hello there'
    end
  end
end
