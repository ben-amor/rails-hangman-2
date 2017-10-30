# Represents the concept of a Guess - a single character which a user has
# guessed in the context of a game
class Guess < ApplicationRecord
  belongs_to :game
  validates :value,
            format: { with: /\A{1}[A-Za-z]\z/, message: \
              'must consist of a single alpha char only' },
            uniqueness: { scope: :game_id, message: 'has already been guessed' }

  def correct?(list_of_characters)
    list_of_characters.include?(guessed_character)
  end
end
