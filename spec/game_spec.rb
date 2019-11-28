# frozen_string_literal: true

require 'spec_helper.rb'

module Hangman
  RSpec.describe Game do
    context '#user_choice' do

      it 'works without a parameter' do
        game = Game.new
        expect{ game.user_choice }.to_not raise_error
      end

      it 'accepts an optional parameter' do
        game = Game.new
        expect{ game.user_choice("p") }.to_not raise_error
      end
    end
  end
end