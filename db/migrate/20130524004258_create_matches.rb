class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name
      t.integer :tournament_id
      t.date :date

      t.timestamps
    end
  end
end
