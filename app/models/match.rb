class Match < ActiveRecord::Base
  attr_accessible :date, :game_id, :name

  has_many :games

  belongs_to :tournament

  accepts_nested_attributes_for :games
  validates_associated :games

  validate :players_switched_sides

  ## Validations

  def players_switched_sides
    if games[0].runner_user == games[1].runner_user
      msg = "Runner may not be the same player twice in a match"
      errors.add(:base, msg)
    end
  end

  ## Handy Methods

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
