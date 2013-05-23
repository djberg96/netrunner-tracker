class AddFactionRestrictionColumns < ActiveRecord::Migration
  def up
    add_column :runners, :min_cards, :integer, :default => 45
    add_column :runners, :max_influence, :integer, :default => 15
    add_column :corporations, :min_cards, :integer, :default => 45
    add_column :corporations, :max_influence, :integer, :default => 15

    Corporation.all.each do |corp|
      corp.min_cards = 45
      corp.max_influence = 15
      corp.save
    end

    Runner.all.each do |runner|
      if runner.name == "Chaos Theory"
        runner.min_cards = 40
      else
        runner.min_cards = 45
      end

      runner.max_influence = 15
      runner.save
    end
  end

  def down
    remove_column :runners, :min_cards
    remove_column :runners, :max_influence
    remove_column :corporations, :min_cards
    remove_column :corporations, :max_influence
  end
end
