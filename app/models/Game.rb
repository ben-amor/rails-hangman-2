class Game < ApplicationRecord

  TURNS_ALLOWED = 10
  private_constant :TURNS_ALLOWED

  def won?
    (secret_word_array - guesses_array).empty?
  end

  def lost?
    (secret_word_array - guesses_array).length >= TURNS_ALLOWED
  end

  def hint
    hint = ''
    secret_word_array.each do |char|
      hint << (guesses_array.include?(char) ? char : '_')
    end
    hint
  end

  private
  def guesses_array
    guesses.split('')
  end

  def secret_word_array
    secret_word.split('')
  end

end
