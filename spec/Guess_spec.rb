describe Guess do
  subject(:guess) { described_class.new(value: 'h') }
  context 'when a guess is correct' do
    it 'is identified as such' do
      expect(guess.correct?(['h'])).to be true
    end
  end

  context 'when a guess is incorrect' do
    it 'is identified as such' do
      expect(guess.correct?(['a'])).to be false
    end
  end
end
