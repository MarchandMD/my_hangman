# frozen_string_literal: true

require 'spec_helper.rb'

module Hangman
  RSpec.describe Game do
    context '#initialize' do
      it 'has :solution, :board, :turns, :letter, :words, :bad_guess attributes' do
        test_game = Game.new
        expect(test_game).to be_truthy
      end
    end
    
  end
end
