class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id

      t.date :played_on
      t.string :week

      t.timestamps
    end
    add_index :games, [:week]
    add_index :games, [:winner_id]
    add_index :games, [:loser_id]
  end
end
