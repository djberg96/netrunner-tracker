class Runner < ActiveRecord::Base
  attr_accessible :faction, :identity, :name

  has_many :games

  FACTIONS = %w[Anarch Criminal Shaper]

  validates :faction,
    :presence  => true,
    :format    => {:with => /\A[a-zA-Z]+\z/, :message => "only letters allowed"},
    :inclusion => {
      :in => FACTIONS,
      :message => 'must be "Anarch", "Criminal" or "Shaper"'
    }

  validates :identity,
    :presence => true

  validates :name,
    :presence => true

  validates_uniqueness_of :faction,
    :scope   => :name,
    :message => "faction + name must be unique"

  ## Handy methods

  def faction_and_name
    faction + ' - ' + name
  end

  def faction_and_short_name
    faction + ' - ' + short_name
  end

  def short_name
    case name
    when /McCaffrey/i
      "Kate"
    when /Gabriel Santiago/i
      "Gabe"
    else
      name
    end
  end
end
