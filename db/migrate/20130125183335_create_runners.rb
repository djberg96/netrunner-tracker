class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.string :faction
      t.string :identity
      t.string :name

      t.timestamps
    end
  end
end
