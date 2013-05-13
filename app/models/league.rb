class League < ActiveRecord::Base
  attr_accessible :comments, :name
  has_many :games

  validates :name,
    :presence   => true,
    :uniqueness => true
end
