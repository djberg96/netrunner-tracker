class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :userid
  attr_accessible :password, :password_confirmation, :admin

  has_many :games_as_runner, :class_name => 'Game', :foreign_key => :runner_user_id
  has_many :games_as_corporation, :class_name => 'Game', :foreign_key => :corporation_user_id
  has_many :leagues_created, :class_name => 'League', :foreign_key => :created_by

  has_secure_password

  ## Constants

  # Maximum number of leagues a user may create
  LEAGUES_CREATE_MAXIMUM = 3

  ## Validations

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

  validates :first_name,
    :allow_blank => true,
    :length => { :maximum => 32 }

  validates :last_name,
    :allow_blank => true,
    :length => { :maximum => 32 }

  ## Pagination

  paginates_per 10

  ## Handy Methods

  def games
    games_as_runner + games_as_corporation
  end

  def total_games
    games.count
  end

  def wins_as_runner
    games_as_runner.where(%Q{
      flatlined != 't' and (
        runner_score > corporation_score or
        draw_death = 't'
      )
    })
  end

  def losses_as_runner
    games_as_runner.where(%Q{flatlined = 't' or runner_score < corporation_score})
  end

  def wins_as_corporation
    games_as_corporation.where(%Q{
      draw_death != 't' and (
        corporation_score > runner_score or
        flatlined = 't'
      )
    })
  end

  def losses_as_corporation
    games_as_corporation.where(%Q{draw_death = 't' or corporation_score < runner_score})
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

  def total_leagues_created
    leagues_created.count
  end

  def maximum_leagues_created?
    total_leagues_created >= LEAGUES_CREATE_MAXIMUM
  end
end
