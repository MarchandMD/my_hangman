# frozen_string_literal: true

class Board

  attr_accessor :letters

  def initialize(letters = '')
    @letters = letters
  end
end