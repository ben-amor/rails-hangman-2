class AddGamesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
     t.string :secret_word
     t.string :guesses
   end
  end
end
