class Guess < ApplicationRecord
  belongs_to :game
  validates :value,
    # presence: true, # Irrelevant, but is it 'idiomatically good' to have it here?
    format: { with: /^{1}[A-Za-z]$/, message: "must consist of a single alpha char only", multiline: true },
    uniqueness: { scope: :game_id, message: "has already been guessed" }

  #def initialize(value) #TODO how do I express that I never want a guess to be constructed without a value, without using an initializer

 #TODO add rubocop plugin to Atom; configure for Rails
end
