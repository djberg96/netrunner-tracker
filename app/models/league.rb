class League < ActiveRecord::Base
  attr_accessible :comments, :name
  has_many :users

  validates :name,
    :presence   => true,
    :uniqueness => true
end
