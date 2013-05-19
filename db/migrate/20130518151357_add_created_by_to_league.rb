class AddCreatedByToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :created_by, :integer
    League.all.each{ |league|
      league.update_attributes!(:created_by => User.find_by_userid('dannyboy').id)
    }
  end
end
