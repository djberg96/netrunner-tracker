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
end
