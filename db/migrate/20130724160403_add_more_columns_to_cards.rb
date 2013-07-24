class AddMoreColumnsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :strength, :string, :default => "0"
    add_column :cards, :num_subs, :string, :default => "1"
    add_column :cards, :advance, :boolean, :default => false
    add_column :cards, :tag, :boolean, :default => false
    add_column :cards, :subtype, :string
    add_column :cards, :text, :text
  end
end
