# frozen_string_literal: false

require 'spec_helper.rb'

module MyHangman
  RSpec.describe Guess do
    context '#initialize' do
      it 'defaults to an empty string' do
        user_input = Guess.new
        expect(user_input.value).to eq('')
      end
      it 'can accept an argument of a single letter' do
        user_input = Guess.new('a')
        expect(user_input.value).to eq('a')
      end
    end

    context '#standardize' do
      it 'turns any argument into upcase' do
        user_input = Guess.new('a')
        expect(user_input.standardize(user_input.value)).to eq('A')
      end
    end

    context '#prompt' do
      it 'requests a guess from the user' do
        # unit test here
      end
      it 'limits the input to one character' do
        user_input = Guess.new('ab')
        letter = user_input.value
        expect(user_input.standardize(letter).length).to eq(1)
      end
    end
  end
end
