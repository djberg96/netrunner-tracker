class Tournament < ActiveRecord::Base
  attr_accessible :created_by, :name, :num_players, :num_rounds, :winner
end
