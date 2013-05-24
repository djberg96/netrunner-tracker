class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :num_players
      t.integer :num_rounds
      t.integer :winner
      t.integer :created_by

      t.timestamps
    end
  end
end
