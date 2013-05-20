class AddGameColumns < ActiveRecord::Migration
  def up
    add_column :games, :flatlined, :boolean, :default => false
    add_column :games, :draw_death, :boolean, :default => false
    add_column :games, :unfinished, :boolean, :default => false

    Game.all do |game|
      game.flatlined  = false
      game.draw_death = false
      game.unfinished = false
      game.save
    end
  end

  def down
    remove_column :games, :flatlined
    remove_column :games, :draw_death
    remove_column :games, :unfinished
  end
end
