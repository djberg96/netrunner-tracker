class Tournament < ActiveRecord::Base
  attr_accessible :created_by, :name, :num_players, :num_rounds, :winner

  has_many :matches
  has_many :games, :through => :matches

  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'

  ## Validations
  validates :name, :length => {:maximum => 32}

  ## Handy Methods

  # Returns an array of userid's associated with the tournament.
  def players
    self.games.map(&:players).flatten.uniq
  end
end
