class Match < ActiveRecord::Base
  attr_accessible :date, :game_id, :name

  has_many :games

  belongs_to :tournament

  accepts_nested_attributes_for :games
  #validates_associated :games

  #validates :players_switched_sides

  def players
    games.first.players
  end

  def game1_winner
    games.first.player_winner
  end

  def game2_winner
    games.last.player_winner
  end

  def match_points
  end
end
