# frozen_string_literal: true

require 'spec_helper.rb'

module Hangman
  RSpec.describe Solution do
    context '#initialize' do
      it 'creates a Solution object' do
        game_solution = Solution.new
        expect(game_solution).to be_truthy
      end

      it " has a default value of 'HANGMAN' " do
        game_solution = Solution.new
        expect(game_solution.value).to eq('HANGMAN')
      end
    end
  end
end
