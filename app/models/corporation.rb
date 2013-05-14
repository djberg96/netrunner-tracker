class Corporation < ActiveRecord::Base
  attr_accessible :faction, :identity, :slogan

  FACTIONS = [
    'Haas-Bioroid',
    'Weyland Consortium',
    'Jinteki',
    'NBN'
  ]

  has_many :games

  validates :faction,
    :presence  => true,
    :inclusion => {
      :in => FACTIONS,
      :message => 'must be ' + FACTIONS.join(', ')
    }

  validates :identity,
    :presence => true

  validates :slogan,
    :presence => true

  validates_uniqueness_of :faction,
    :scope   => :slogan,
    :message => 'faction + slogan must be unique'
end
