class AddLeagueIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :league_id, :integer
  end
end
