module GameHelper
  def create_hint_for_screen(hint_characters)
    hint_characters.map { |char| char ? char : '_'}.join('')
  end

  def all_guesses_alphabetically_ordered_as_string(guess_characters)
    guess_characters.sort.join(', ')
  end

  def message_about_last_guess(guess_fitness_result)
    case guess_fitness_result
      when :not_a_character
        "You can only enter alphabetic characters"
      when :already_guessed
        "You have already guessed that character"
      when :correct
        "Correct"
      when :incorrect
        "Incorrect"
      else
        raise "A case needs adding to message_about_last_guess"
    end
  end
end
