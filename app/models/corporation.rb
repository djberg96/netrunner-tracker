class Corporation < ActiveRecord::Base
  attr_accessible :faction, :identity

  validates :faction,
    :presence   => true,
    :uniqueness => true
end
