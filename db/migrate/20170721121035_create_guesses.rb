class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :round_id, null: false
      t.integer :card_id, null: false
      t.boolean :correct, null: false
      t.integer :attempts, default: 0

      t.timestamp
    end
  end
end
