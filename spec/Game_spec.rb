require 'rails_helper'
require 'game'

describe Game do

  context 'describing the type' do
    subject(:game){described_class.new}

    it 'has a secret_word property' do
      expect(game.secret_word).to be_nil
    end

    it 'has a guesses property' do
      expect(game.guesses).to be_nil
    end
  end

end

describe Game do

  let(:secret_word){'hello'}
  let(:guesses){''}

  subject(:game) {described_class.new(secret_word: secret_word, guesses: guesses)}

  context 'when all letters have been guessed correctly' do
    let(:guesses){'hello'}
    it 'is won' do
      expect(game.won?).to be true
    end
  end

  context 'when the player does not have lives remaining' do
    let(:guesses){'abcdfgjkmn'}
    it 'is lost' do
      expect(game.lost?).to be false
    end
  end

  context 'when some characters have been guessed' do
    let(:guesses){'l'}
    it 'shows the right hint' do
      expect(game.hint).to eq('__ll_')
    end
  end

end
