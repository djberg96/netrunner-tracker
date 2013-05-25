class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :league_id
      t.integer :runner_user_id
      t.integer :corporation_user_id
      t.integer :runner_id
      t.integer :corporation_id
      t.integer :runner_score
      t.integer :corporation_score
      t.date :date, :default => Time.now
      t.text :comment

      t.timestamps
    end
  end
end
