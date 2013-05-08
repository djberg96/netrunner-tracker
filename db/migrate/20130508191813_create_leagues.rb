class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.text :comments

      t.timestamps
    end
  end
end
