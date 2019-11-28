# frozen_string_literal: false

require "spec_helper.rb"

module Hangman
  RSpec.describe Letter do
    context "#initialize" do
      it "defaults to an empty string" do
        user_input = Letter.new
        expect(user_input.value).to eq("")
      end
      it "can accept an argument of a single letter" do
        user_input = Letter.new("a")
        expect(user_input.value).to eq("a")
      end
    end
  end
end
