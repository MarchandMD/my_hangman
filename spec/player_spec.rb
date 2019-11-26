
require 'spec_helper.rb'

module MyHangman
  RSpec.describe Player do
    context '#initialize' do
      it 'creates a Player object' do
        player_1 = Player.new
        expect(player_1).to be_a(Player)
      end

      it 'can accept a name' do
        player_1 = Player.new('michael')
        expect(player_1.name).to eq('michael')
      end
    end

    context '#prompt' do
      it 'returns the input' do
        michael = Player.new('michael')
        expect(michael.prompt('a')).to eq('a')
      end
      it 'can accept a parameter' do
        player = Player.new
        expect(player.prompt('a')).to eq('a')
      end
    end
  end
end
