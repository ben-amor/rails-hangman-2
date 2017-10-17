class Guess < ApplicationRecord
  belongs_to :game
  #def initialize(value) #TODO how do I express that I never want a guess to be constructed without a value, without using an initializer

end
