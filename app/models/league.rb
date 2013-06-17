class League < ActiveRecord::Base
  extend FriendlyId

  attr_accessible :comments, :name, :created_by

  has_many :games
  has_many :matches, :through => :games, :uniq => true
  has_many :runner_users, :through => :games, :order => "lower(userid)"
  has_many :corporation_users, :through => :games, :order => "lower(userid)"

  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'

  friendly_id :name, :use => :slugged

  ## Validations

  validate :check_max, :on => :create

  def check_max
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
    runner_users + corporation_users
  end
end
