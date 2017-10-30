module GameHelper
  def create_hint_for_screen(hint_characters)
    hint_characters.map { |char| char ? char : '_'}.join('')
  end

  def all_guesses_alphabetically_ordered_as_string(guess_characters)
    guess_characters.sort.join(', ')
  end

  def message_about_last_guess(game)
    return "" if game.most_recent_guess_value == nil
    "Last guess: #{game.correct_guess?(game.most_recent_guess_value) ? 'Correct' : 'Incorrect'}"
  end

  def won_or_lost_message(game)
    return "You won" if game.won?
    return "You lost" if game.lost?
    return "The game is in progress"
  end
end
