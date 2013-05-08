class Corporation < ActiveRecord::Base
  attr_accessible :faction, :identity, :slogan

  validates :faction,
    :presence => true

  validates :identity,
    :presence => true

  validates :slogan,
    :presence => true

  validates_uniqueness_of :faction,
    :scope   => :slogan,
    :message => 'faction + slogan must be unique'
end
