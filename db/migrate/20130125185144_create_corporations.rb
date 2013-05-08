class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :faction
      t.string :slogan
      t.string :identity

      t.timestamps
    end
  end
end
