class Game < ApplicationRecord
  has_many :guesses
  validates :secret_word, presence: true

  :correct
  :incorrect
  :already_guessed

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

  def hint
    secret_word_characters.map { |char| char if (guess_characters.include?(char)) }
  end

  def guess_fitness(guessed_character)
    case
    when guess_characters.include?(guessed_character)
        :already_guessed
      when secret_word_characters.include?(guessed_character)
        :correct
      else
        :incorrect
    end
  end

  def guess!(guessed_character)
    return if guess_fitness(guessed_character) == :already_guessed

    guesses << Guess.create(value: guessed_character)

  end

  private

  def secret_word_characters
    secret_word.split('')
  end

  def guess_characters
    guesses.map {|g| g.value} # TODO this should be .pluck(:value) - pluck may only work for records which have previoulsy been saved
  end

end
