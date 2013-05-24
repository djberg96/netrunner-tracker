class Match < ActiveRecord::Base
  attr_accessible :date, :game_id, :name

  has_many :games

  belongs_to :tournament

  accepts_nested_attributes_for :games

  #validates :players_switched_sides

  def players
    game = games.first
    [game.runner_user.userid, game.corporation_user.userid]
  end
end
