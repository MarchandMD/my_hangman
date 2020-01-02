# frozen_string_literal: true

require "spec_helper.rb"

module Hangman
  RSpec.describe Board do
    context "#initialize" do
      it "has '@letters' attribute" do
        new_board = Board.new
        expect(new_board).to have_attributes(:letters => [*("A".."Z")])
      end
    end

    context "#letters" do
      
      it "is an Array" do
        new_board = Board.new
        expect(new_board.letters).to be_an(Array)
      end

      it "contains the entire alphabet, by default" do
        new_board = Board.new
        the_alphabet = [*("A".."Z")]
        expect(the_alphabet.include?(new_board.letters.sample)).to be_truthy 
      end

      it "can be initialized with a partial alphabet" do
        partial_alphabet = [*("A".."M")]
        new_board = Board.new(partial_alphabet)
        expect(new_board.letters).to eq(partial_alphabet)
      end
    end

    context "#remove_letter" do
      it "replaces an available letter with an empty string" do
        new_board = Board.new
        new_board.remove_letter(0)
        expect(new_board.letters[0]).to eq(" ")
      end
    end

    context "#update_dude" do
      it 'displays the entire hangman' do
        board = Board.new
        expect { board.update_dude(19) }.to output(" ______  \n |    |  \n |    -  \n |   | | \n |    =  \n |    |  \n |   -|- \n |    |  \n |   / \\\n").to_stdout
      end
      
    end
  end
end
