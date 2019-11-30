# frozen_string_literal: true

require "spec_helper.rb"

module Hangman
  RSpec.describe Board do
    context "#initialize" do
      it "is initialized with an array by default in @letters" do
        new_board = Board.new
        expect(new_board.letters).to be_an(Array)
      end

      context "#letters" do
        it "contains the entire alphabet, by default" do
          new_board = Board.new
          expect(new_board.letters.length).to be(26)
        end

        it "starts with 'A' and ends with 'Z'" do
          new_board = Board.new
          expect(new_board.letters[0]).to eq("A")
        end
      end

      # want to be able to pass incomplete alphabets, for testing
      it "can be initialized with a parameter, passed to @letters" do
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
  end
end
