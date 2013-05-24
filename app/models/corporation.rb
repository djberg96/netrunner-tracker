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

  def short_faction_and_slogan
    short_name + ' - ' + slogan
  end

  def short_faction_and_short_slogan
    short_name + ' - ' + short_slogan
  end

  def short_name
    case faction
    when 'Weyland Consortium'
      'Weyland'
    when 'Haas-Bioroid'
      'HB'
    else
      faction
    end
  end

  def short_slogan
    case slogan
    when "Engineering the Future"
      "EtF"
    when "Stronger Together"
      "ST"
    when "Personal Evolution"
      "PE"
    when "Replicating Perfection"
      "RP"
    when "Making News"
      "MN"
    when "Building a Better World"
      "BaBW"
    else
      slogan
    end
  end
end
