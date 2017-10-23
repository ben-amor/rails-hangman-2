class Guess < ApplicationRecord
  belongs_to :game
  validates :value,
    presence: true,
    format: {with: /[A-Za-z]{1}/, message: "Single alpha chars only"},
    uniqueness: {scope: :game_id, message: "You have already guessed that"}

  #def initialize(value) #TODO how do I express that I never want a guess to be constructed without a value, without using an initializer


end
