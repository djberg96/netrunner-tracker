class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :league_id, :userid
  attr_accessible :password, :password_confirmation, :admin

  belongs_to :league

  has_many :games_as_runner, :class_name => 'Game', :foreign_key => :runner_user_id
  has_many :games_as_corporation, :class_name => 'Game', :foreign_key => :corporation_user_id

  has_secure_password

  validates :password,
    :presence => true,
    :length   => {
      :minimum  => 6,
      :maximum  => 32
    }

  def games
    games_as_runner + games_as_corporation
  end

  def total_games
    games.count
  end

  def wins_as_runner
    games_as_runner.where("runner_score > corporation_score")
  end

  def wins_as_corporation
    games_as_corporation.where("corporation_score > runner_score")
  end

  def total_wins_as_runner
    wins_as_runner.count
  end

  def total_wins_as_corporation
    wins_as_corporation.count
  end

  def total_wins
    total_wins_as_runner + total_wins_as_corporation
  end
end
