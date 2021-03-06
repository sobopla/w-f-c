class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :deck_id, null: false
      t.integer :user_id, null: false
      t.boolean :finished, null: false

      t.timestamp
    end
  end
end

