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
        expect(game_solution.value.join('')).to eq('HANGMAN')
      end

      it "can accept a different value besides the default" do
        game_solution = Solution.new("doughnuts")
        expect(game_solution.value.join('')).to eq('DOUGHNUTS')
      end
    end
    context '#obscured' do
      it 'converts the default value to dashes' do
        test_solution = Solution.new("testing")
        test_solution.obscured.each { |x| expect(x).to eq("_") }
      end
    end
  end
end
