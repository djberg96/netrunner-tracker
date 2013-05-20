class League < ActiveRecord::Base
  attr_accessible :comments, :name, :created_by

  has_many :games
  has_many :runner_users, :through => :games, :uniq => true, :order => "lower(userid)"
  has_many :corporation_users, :through => :games, :uniq => true, :order => "lower(userid)"

  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'

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

  # TODO: For whatever reason, when I try to simply concatenate
  # runner_users + corporation_users I get an array instead of an
  # AR relation. So I have to resort to this nonsense.
  def users
    Kaminari.paginate_array((runner_users + corporation_users).uniq)
=begin
    # This, too, returns an array instead of a relation.
    User.find_by_sql(%Q{
      SELECT distinct u.*
      FROM users u, games g, leagues l
      WHERE (
        u.id = g.runner_user_id OR
        u.id = g.corporation_user_id
      )
      AND l.id = g.league_id
    })
=end
  end
end
