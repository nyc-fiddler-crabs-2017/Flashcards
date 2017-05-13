class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.references :user, foreign_key: true, null: false
      t.references :deck, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
