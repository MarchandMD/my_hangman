# frozen_string_literal: true

require 'spec_helper.rb'

module Hangman
  RSpec.describe Game do
    context '#user_choice' do
      it 'accepts an optional parameter' do
        game = Game.new
        expect { game.user_choice("p") }.to_not raise_error
      end
    end
    context '#take_a_turn' do
      it "updates the @letter instance variable" do
        new_game = Game.new
        new_game.take_a_turn('a')
        expect(new_game.letter).to eq('a')
      end

      it 'returns the @letter instance variable' do
        new_game = Game.new
        expect(new_game.take_a_turn('a')).to eq('a')
      end
    end
  end
end
