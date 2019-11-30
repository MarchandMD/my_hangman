# frozen_string_literal: true

require 'my_hangman/version'

module Hangman
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './my_hangman/board.rb'
require_relative './my_hangman/solution.rb'
require_relative './my_hangman/game.rb'
