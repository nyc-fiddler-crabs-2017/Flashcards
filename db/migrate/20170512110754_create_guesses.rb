class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.string :attempt, null: false
      t.references :card, foreign_key: true, null: false
      t.references :round, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
