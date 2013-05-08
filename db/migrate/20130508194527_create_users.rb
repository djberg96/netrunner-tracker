class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.string :email
      t.string :password_digest
      t.integer :league_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
