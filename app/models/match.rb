class Match < ActiveRecord::Base
  attr_accessible :date, :game_id

  has_many :games
  belongs_to :tournament
end
