# frozen_string_literal: true

require "spec_helper.rb"

module MyHangman
  RSpec.describe Solution do
    context "#initialize" do
      it "creates a Solution object" do
        new_board = Board.new
        expect(new_board).to be_truthy
      end
    end
  end
end
