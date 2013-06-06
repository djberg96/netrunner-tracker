class AddOctgnidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :octgnid, :string, :limit => 32
  end
end
