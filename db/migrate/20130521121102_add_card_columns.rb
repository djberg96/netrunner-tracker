class AddCardColumns < ActiveRecord::Migration
  def up
    add_column :cards, :influence, :integer, :default => 0
    add_column :cards, :agenda_points, :integer, :default => 0
    add_column :cards, :cost, :integer, :default => 0

    Card.all.each do |card|
      card.influence = 0
      card.agenda_points = 0
      card.cost = 0
      card.save
    end
  end

  def down
    remove_column :cards, :influence
    remove_column :cards, :agenda_points
    remove_column :cards, :cost
  end
end
