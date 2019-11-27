# frozen_string_literal: true

require 'spec_helper.rb'

module MyHangman
  RSpec.describe Board do
    context '#initialize' do
      it 'creates a board object' do
        new_board = Board.new
        expect(new_board).to be_truthy
      end

      it 'has an array of the entire alphabet' do
        new_board = Board.new
        expect(new_board.letters).to be_an(Array)
      end
    end

    context '#remove_letter' do
      it 'replaces a letter with an empty string' do
        new_board = Board.new
        new_board.remove_letter(0)
        expect(new_board.letters[0]).to eq(' ')
      end
    end
  end
end
