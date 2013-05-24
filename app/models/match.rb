class Match < ActiveRecord::Base
  attr_accessible :date, :game_id, :name

  has_many :games
  belongs_to :tournament

  accepts_nested_attributes_for :games
end
