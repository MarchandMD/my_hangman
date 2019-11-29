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

    # context '#obscured' do
    #   it 'turns the solution into dashes and spaces' do
    #     test_solution = Solution.new('cow')
    #     expect(test_solution.obscured).to eq('_ _ _ ')
    #   end
    # end

    context '#reveal' do
      it 'accepts a String as a parameter' do
      solution = Solution.new
      expect{ solution.reveal('a') }.to_not raise_error
      end

      it 'returns the @obscured instance variable' do
        solution = Solution.new
        expect(solution.reveal('a')).to eq(solution.obscured)
      end

      it 'updates the first element of the @obscured variable' do
        solution = Solution.new
        expect(solution.reveal('H')).to eq('H _ _ _ _ _ _ ')
      end

      it 'properly updates other elements of the @obscured variable' do
        solution = Solution.new
        expect(solution.reveal('N')).to eq('_ _ N _ _ _ _ ')
      end
    end
  end
end
