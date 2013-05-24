class AddPointsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :player1_match_points, :integer, :default => 0
    add_column :matches, :player2_match_points, :integer, :default => 0
    add_column :matches, :player1_prestige_points, :integer, :default => 0
    add_column :matches, :player2_prestige_points, :integer, :default => 0
  end
end
