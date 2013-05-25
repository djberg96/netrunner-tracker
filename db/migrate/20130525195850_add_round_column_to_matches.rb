class AddRoundColumnToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :round, :integer, :default => 1
  end
end
