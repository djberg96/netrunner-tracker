class League < ActiveRecord::Base
  attr_accessible :comments, :name, :created_by

  has_many :games
  has_many :runner_users, :through => :games, :uniq => true, :order => "lower(userid)"
  has_many :corporation_users, :through => :games, :uniq => true, :order => "lower(userid)"

  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'

  #has_many :players, :through => :games, :source => :runner_user, :uniq => true

  ## Validations

  validate do |league|
    if User.find(created_by).maximum_leagues_created?
      msg = "A player may not create more than 3 leagues."
      errors.add(:name, msg)
    end
  end

  validates :name,
    :presence   => true,
    :uniqueness => true,
    :length => {
      :minimum => 2,
      :maximum => 32
    }

  ## Pagination

  paginates_per 10

  ## Handy Methods

  # This returns an array. To convert it to an AR relation, use
  # User.where(:id => league#users).
  #
  def users
    (runner_users + corporation_users).uniq
  end
end
