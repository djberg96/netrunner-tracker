class Match < ActiveRecord::Base
  attr_accessible :date, :game_id, :name

  has_many :games

  belongs_to :tournament

  accepts_nested_attributes_for :games
  validates_associated :games

  validate :players_switched_sides

  before_save :set_match_points

  ## Validations

  def players_switched_sides
    if games[0].runner_user == games[1].runner_user
      msg = "Player may not be the same faction twice in a match"
      errors.add(:base, msg)
    end
  end

  ## Callbacks

  def set_match_points
    player1 = games[0].runner_user.userid
    player2 = games[0].corporation_user.userid

    player1_match_points = 0
    player2_match_points = 0

    games.each do |g|
      if player1 == g.player_winner
        self.player1_match_points += 10
        self.player2_match_points += g.player_loser_score
      else
        self.player2_match_points += 10
        self.player1_match_points += g.player_loser_score
      end
    end
  end

  ## Handy Methods

  def players
    games.first.players
  end

  def game1_winner
    games.first.player_winner
  end

  def game1_loser
    games.first.player_loser
  end

  def game2_winner
    games.last.player_winner
  end

  def game2_loser
    games.last.player_loser
  end
end
