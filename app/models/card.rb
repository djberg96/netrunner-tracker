class Card < ActiveRecord::Base
  attr_accessible :faction, :title, :kind

  FACTIONS = [
    'Haas-Bioroid',
    'Jinteki',
    'NBN',
    'Weyland',
    'Neutral Corp',
    'Anarch',
    'Criminal',
    'Shaper',
    'Neutral Runner'
  ]

  TYPES = [
    'Agenda',
    'Asset',
    'Ice',
    'Identity',
    'Operation',
    'Upgrade',
    'Event',
    'Hardware',
    'Program',
    'Resource',
  ]

  validates :title,
    :presence   => true,
    :uniqueness => true

  validates :faction,
    :presence  => true,
    :inclusion => {:in => FACTIONS, :message => "Invalid faction"}

  validates :kind,
    :presence  => true,
    :inclusion => {:in => TYPES, :message => "Invalid card type"}
end
