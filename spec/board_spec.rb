require 'spec_helper.rb'

module MyHangman

  RSpec.describe Board do
    context '#initialize' do
      it 'creates a board object' do
        new_board = Board.new
        expect(new_board).to be_truthy
      end
    end
  end

end