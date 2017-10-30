require 'rails_helper'

describe Game do
  def create_guesses(letters)
    result = []
    characters = letters.split('')
    characters.each do |char|
      result << Guess.create(value: char)
    end
    result
  end

  let(:secret_word) { 'hello' }
  let(:guesses) { [] }

  subject(:game) { described_class.new(secret_word: secret_word, guesses: guesses) }

  context 'when all letters have been guessed correctly' do
    let(:guesses) { create_guesses('helo') }

    it 'is won' do
      expect(game).to be_won
    end
  end

  context 'when the player does not have lives remaining' do
    let(:guesses) { create_guesses('abcdfgijkm') }

    it 'is lost' do
      expect(game).to be_lost
    end
  end

  context 'when one correct character has been guessed' do
    let(:guesses) { create_guesses('l') }

    it 'generates a hint with the guessed character' do
      expect(game.hint_characters).to eq([nil, nil, 'l', 'l', nil])
    end
  end

  context 'when only an incorrect character has been guessed' do
    let(:guesses) { create_guesses('a') }

    it 'generates a blank hint' do
      expect(game.hint_characters).to eq([nil, nil, nil, nil, nil])
    end
  end

  context 'when a correct guess is made' do
    let(:guesses) { create_guesses('e') }

    it 'adds a guess with the correct value to the game state' do
      expect(game.guesses.first.value).to eq('e')
    end

    it 'does not add multiple guesses to the game state' do
      expect(game.guesses.length).to eq(1)
    end

    it 'does not cause a life to be lost' do
      expect(game.lives_remaining).to eq(10)
    end
  end

  context 'when an incorrect guess is made' do
    let(:guesses) { create_guesses('a') }

    it 'adds the guess to the game state' do
      expect(game.guesses.first.value).to eq('a')
    end

    it 'causes a life to be lost' do
      expect(game.lives_remaining).to eq(9)
    end
  end
end
