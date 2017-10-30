class MakeSecretWordAndGuessValueNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :secret_word, :string, null: false
    change_column :guesses, :value, :string, null: false
  end
end
