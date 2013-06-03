class AddSlugToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :slug, :string
    add_index :leagues, :slug

    League.find_each(&:save)
  end
end
