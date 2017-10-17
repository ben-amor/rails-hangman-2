class Game < ApplicationRecord
  has_many :guesses, :autosave => true
  validates :secret_word, presence: true

  :correct
  :incorrect
  :already_guessed
  :not_a_character

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

  # TODO this relates to guesses, not games, and could move out?
  def guess_fitness(guessed_character)
    case
    when !/[A-Za-z]/.match(guessed_character)
        :not_a_character
      when guess_characters.include?(guessed_character)
        :already_guessed
      when secret_word_characters.include?(guessed_character)
        :correct
      else
        :incorrect
    end
  end

  def affects_game_state?(guess_fitness_result)
    (guess_fitness_result == :correct || guess_fitness_result == :incorrect)
  end


  def guess_characters
    guesses.map {|g| g.value}
  end

  private

  def secret_word_characters
    secret_word.split('')
  end

end
