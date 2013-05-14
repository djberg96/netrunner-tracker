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
    :inclusion => {:in => FACTIONS}

  validates :identity,
    :presence => true,
    :length   => {
      :minimum => 2,
      :maximum => 32
    }

  validates :slogan,
    :presence => true,
    :length   => {
      :minimum => 2,
      :maximum => 32
    }

  validates_uniqueness_of :faction,
    :scope   => :slogan,
    :message => 'faction + slogan must be unique'

  ## Handy methods

  def faction_and_slogan
    faction + ' - ' + slogan
  end
end
