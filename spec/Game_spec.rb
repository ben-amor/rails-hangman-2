require 'rails_helper'

describe Game do

  let(:secret_word){'hello'}
  let(:guesses){[]}

  subject(:game) {described_class.new(secret_word: secret_word, guesses: guesses)}

  context 'when all letters have been guessed correctly' do
    let(:guesses){[Guess.new(value: 'h'), Guess.new(value: 'e'), Guess.new(value: 'l'), Guess.new(value: 'o')]}
    it 'is won' do
      expect(subject.won?).to be true
    end
  end

  context 'when the player does not have lives remaining' do
    let(:guesses){[Guess.new(value: 'a'), Guess.new(value: 'b'), Guess.new(value: 'c'), Guess.new(value: 'd'), Guess.new(value: 'f'), Guess.new(value: 'g'), Guess.new(value: 'j'), Guess.new(value: 'k'), Guess.new(value: 'm'), Guess.new(value: 'n')]}
    it 'is lost' do
      expect(subject.lost?).to be true
    end
  end

  context 'when one correct character has been guessed' do
    let(:guesses){[Guess.new(value: 'l')]}
    it 'generates a hint with the guessed character' do
      expect(subject.hint_characters).to eq([nil,nil,'l','l',nil])
    end
  end

  context 'when only an incorrect character has been guessed' do
    let(:guesses){[Guess.new(value: 'a')]}
    it 'generates a blank hint' do
      expect(subject.hint_characters).to eq([nil,nil,nil,nil,nil])
    end
  end

  context 'when a correct guess is made' do

    before do
      subject.guesses << Guess.new(value: 'e')
    end

    it 'adds a guess with the correct value to the game state' do
      expect(subject.guesses.first.value).to eq('e')
    end

    it 'does not add multiple guesses to the game state' do
      expect(subject.guesses.length).to eq(1)
    end

    it 'does not cause a life to be lost' do
      expect(subject.lives_remaining).to eq(10)
    end

  end

  context 'when an incorrect guess is made' do
    before do
      subject.guesses << Guess.new(value: 'a')
    end

    it 'adds the guess to the game state' do
      expect(subject.guesses.first.value).to eq('a')
    end

    it 'causes a life to be lost' do
      expect(subject.lives_remaining).to eq(9)
    end

  end

  context 'when a guess is correct' do
    it 'is identified as such' do
      expect(subject.correct_guess?('h')).to be true
    end
  end

  context 'when a guess is incorrect' do
    it 'is identified as such' do
      expect(subject.correct_guess?('a')).to be false
    end
  end

end
