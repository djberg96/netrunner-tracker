class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :userid
  attr_accessible :password, :password_confirmation, :admin

  has_many :games_as_runner, :class_name => 'Game', :foreign_key => :runner_user_id
  has_many :games_as_corporation, :class_name => 'Game', :foreign_key => :corporation_user_id

  has_secure_password

  validates :userid,
    :uniqueness => true,
    :length     => {
      :minimum => 2,
      :maximum => 16
    }

  validates :email,
    :uniqueness => true,
    :length     => {
      :minimum => 5,
      :maximum => 32
    }

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

  def losses_as_runner
    games_as_runner.where("runner_score < corporation_score")
  end

  def wins_as_corporation
    games_as_corporation.where("corporation_score > runner_score")
  end

  def losses_as_corporation
    games_as_corporation.where("corporation_score < runner_score")
  end

  def total_wins_as_runner
    wins_as_runner.count
  end

  def total_losses_as_runner
    losses_as_runner.count
  end

  def total_wins_as_corporation
    wins_as_corporation.count
  end

  def total_losses_as_corporation
    losses_as_corporation.count
  end

  def total_wins
    total_wins_as_runner + total_wins_as_corporation
  end

  def total_losses
    total_losses_as_runner + total_losses_as_corporation
  end
end
