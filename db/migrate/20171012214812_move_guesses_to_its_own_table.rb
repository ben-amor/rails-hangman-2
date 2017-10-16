class MoveGuessesToItsOwnTable < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
     t.string :value
    end

    remove_column :games, :guesses

  end
end
