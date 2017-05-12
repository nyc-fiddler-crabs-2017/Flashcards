class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
