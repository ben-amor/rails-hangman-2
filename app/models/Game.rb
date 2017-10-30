class Game < ApplicationRecord
  has_many :guesses
  validates :secret_word, presence: true

  TURNS_ALLOWED = 10
  private_constant :TURNS_ALLOWED

  def in_progress?
    !won? && !lost?
  end

  def most_recent_guess
    return nil if guesses.none?
    guesses.last
  end

  def won?
    (secret_word_characters - guess_characters).empty?
  end

  def lost?
    lives_remaining <= 0
  end

  def lives_remaining
    TURNS_ALLOWED - (guess_characters - secret_word_characters).length
  end

  def hint_characters
    secret_word_characters.map { |c| c if guess_characters.include?(char) }
  end

  def guess_characters
    guesses.pluck(:value)
  end

  private

  def secret_word_characters
    secret_word.split('')
  end
end
