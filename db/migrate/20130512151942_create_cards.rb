class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.string :kind
      t.string :faction

      t.timestamps
    end
  end
end
