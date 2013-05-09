class Runner < ActiveRecord::Base
  attr_accessible :faction, :identity, :name

  has_many :games

  validates :faction,
    :presence  => true,
    :format    => {:with => /\A[a-zA-Z]+\z/, :message => "only letters allowed"},
    :inclusion => {
      :in => %w[Anarchist Criminal Shaper],
      :message => 'must be "Anarchist", "Criminal" or "Shaper"'
    }

  validates :identity,
    :presence => true

  validates :name,
    :presence => true

  validates_uniqueness_of :faction,
    :scope   => :name,
    :message => "faction + name must be unique"
end
