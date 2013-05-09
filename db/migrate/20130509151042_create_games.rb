class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :runner_user_id
      t.integer :corp_user_id
      t.integer :runner_id
      t.integer :corp_id
      t.integer :runner_score
      t.integer :corp_score
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end
