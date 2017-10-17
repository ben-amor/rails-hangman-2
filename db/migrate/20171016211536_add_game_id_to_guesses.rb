class AddGameIdToGuesses < ActiveRecord::Migration[5.1]
  def change
    add_column :guesses, :game_id, :integer
  end
end
