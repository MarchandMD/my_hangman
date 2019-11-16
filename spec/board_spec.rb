# frozen_string_literal: true

require 'spec_helper.rb'

module MyHangman
  RSpec.describe Board do
    context '#initialize' do
      it 'creates a board object' do
        new_board = Board.new
        expect(new_board).to be_truthy
      end
    end

    context '#available_letters' do
      it "displays A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" do
        new_board = Board.new
        expect { new_board.available_letters }.to output { 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z' }.to_stdout
      end
    end
  end
end
