class League < ActiveRecord::Base
  attr_accessible :comments, :name
  has_many :games

  validates :name,
    :presence   => true,
    :uniqueness => true,
    :length => {
      :minimum => 2,
      :maximum => 32
    }

end
