class Game < ApplicationRecord
  has_many :guesses#, :autosave => true # CHECK saves guesses when game is saved? TODO cascading delete game->guesses
  validates :secret_word, presence: true

  TURNS_ALLOWED = 10
  private_constant :TURNS_ALLOWED

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
    secret_word_characters.map { |char| char if (guess_characters.include?(char)) }
  end

  def correct_guess?(guessed_character)
   secret_word_characters.include?(guessed_character)
  end

  def guess_characters
    guesses.map {|g| g.value}
  end

  private

  def secret_word_characters
    secret_word.split('')
  end

end
