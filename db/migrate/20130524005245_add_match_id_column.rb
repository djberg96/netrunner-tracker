class AddMatchIdColumn < ActiveRecord::Migration
  def up
    add_column :games, :match_id, :integer
  end

  def down
    remove_column :games, :match_id
  end
end
