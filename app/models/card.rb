class Card < ActiveRecord::Base
  attr_accessible :faction, :title, :kind, :cost, :agenda_points, :influence

  validate :agenda_has_points_set
  validate :non_agenda_has_no_agenda_points

  FACTIONS = [
    'Anarch',
    'Criminal',
    'Haas-Bioroid',
    'Jinteki',
    'NBN',
    'Neutral Corporation',
    'Neutral Runner',
    'Shaper',
    'Weyland'
  ]

  TYPES = [
    'Agenda',
    'Asset',
    'Event',
    'Hardware',
    'Ice',
    'Identity',
    'Operation',
    'Program',
    'Resource',
    'Upgrade',
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

  validates :agenda_points,
    :inclusion => {:in => 1..3},
    :allow_nil => true

  validates :cost, :inclusion => {:in => 0..15}
  validates :influence, :inclusion => {:in => 0..4}

  def agenda_has_points_set
    if kind == 'Agenda' && agenda_points.nil?
      errors.add :agenda_points, "Agenda must be worth 1-3 points"
    end
  end

  def non_agenda_has_no_agenda_points
    if kind != 'Agenda' && agenda_points
      errors.add :agenda_points, "Cannot set agenda points for non-agenda card"
    end
  end

  ## Handy Methods

  def agenda?
    kind == 'Agenda'
  end
end
