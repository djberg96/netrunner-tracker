class Match < ActiveRecord::Base
  attr_accessible :date, :game_id, :name, :tournament_id, :league_id, :round, :comment

  has_many :games, :dependent => :destroy

  belongs_to :tournament
  belongs_to :league

  accepts_nested_attributes_for :games
  validates_associated :games

  validate :players_switched_sides

  before_save :set_match_points
  before_save :set_prestige_points
  before_save :update_tournament_count

  ## Validations

  def players_switched_sides
    if games[0].runner_user == games[1].runner_user
      msg = "Player may not be the same faction twice in a match"
      errors.add(:base, msg)
    end
  end

  ## Callbacks

  # Automatically set the number of players for a tournment when a match
  # is added to that tournament.
  #--
  # TODO: There's probably a better way to get the number of players.
  #
  def update_tournament_count
    if self.tournament
      m_with_t = Match.where("tournament_id is not null")
      num = m_with_t.map(&:games).flatten.map(&:runner_user).map(&:userid).uniq.size
      self.tournament.num_players = num
      self.tournament.save
    end
  end

  def set_match_points
    self.player1_match_points = 0
    self.player2_match_points = 0

    games.each do |g|
      if player1.userid == g.player_winner
        self.player1_match_points += 10
        self.player2_match_points += g.player_loser_score
      else
        self.player2_match_points += 10
        self.player1_match_points += g.player_loser_score
      end
    end
  end

  def set_prestige_points
    self.player1_prestige_points = 0
    self.player2_prestige_points = 0

    games.each do |g|
      if player1.userid == g.player_winner
        self.player1_prestige_points += 2
      else
        self.player2_prestige_points += 2
      end
    end

    if player1.userid == match_winner
      self.player1_prestige_points += 2
    elsif player2.userid == match_winner
      self.player2_prestige_points += 2
    else
      self.player1_prestige_points += 1
      self.player2_prestige_points += 1
    end
  end

  def match_winner
    if player1_match_points > player2_match_points
      player1.userid
    elsif player1_match_points < player2_match_points
      player2.userid
    else
      "NONE"
    end
  end

  ## Handy Methods

  def players
    games.first.players
  end

  def player1
    games[0].runner_user
  end

  def player2
    games[0].corporation_user
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
