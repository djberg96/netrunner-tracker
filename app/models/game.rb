class Game < ActiveRecord::Base
  attr_accessible :comment, :corporation_id, :corporation_score, :corporation_user_id
  attr_accessible :league_id, :date, :runner_id, :runner_score, :runner_user_id
  attr_accessible :flatlined, :draw_death, :unfinished

  belongs_to :runner_user, :class_name => 'User'
  belongs_to :corporation_user, :class_name => 'User'

  belongs_to :runner
  belongs_to :corporation
  belongs_to :league
  belongs_to :match

  validate :runner_and_corporation_are_not_same_player

  # TODO: I want to use a custom label (like "scores"), but I can't get it to
  # work with web-app-theme.
  validate do |game|
    if runner_score < 7 && corporation_score < 7 && !flatlined? && !draw_death? && !unfinished?
      msg = "At least one player must score 7 or more points"
      errors.add(:runner_score, msg)
    end

    if runner_score >= 7 && corporation_score >= 7
      msg = "Both players may not have 7 or more points"
      errors.add(:runner_score, msg)
    end

    if runner_score >= 7 && flatlined?
      msg = "Runner cannot flatline and have more than 6 points."
      errors.add(:runner_score, msg)
    end

    if corporation_score >= 7 && draw_death?
      msg = "Corporation cannot suffer draw death and have more than 6 points."
      errors.add(:corporation_score, msg)
    end

    if flatlined? && draw_death?
      msg = "Game cannot end in both flatlining and draw death"
      errors.add(:flatlined, msg)
    end

    if (flatlined? && unfinished?) || (draw_death? && unfinished?)
      msg = "Runner was flatlined or Corp suffered draw death. Game is not unfinished."
      errors.add(:unfinished, msg)
    end
  end

  validates :runner_score,
    :numericality => {
      :greater_than_or_equal_to => 0,
      :less_than_or_equal_to    => 15
    }

  validates :corporation_score,
    :numericality => {
      :greater_than_or_equal_to => 0,
      :less_than_or_equal_to    => 15
    }

  ## Pagination

  paginates_per 10

  ## Custom validations

  def runner_and_corporation_are_not_same_player
    if runner_user_id == corporation_user_id
      errors.add(:corporation_user_id, "cannot be same player as runner")
    end
  end

  ## Handy methods

  def players
    [runner_user, corporation_user]
  end

  def faction_winner
    if flatlined?
      corporation.short_faction_and_short_slogan
    elsif draw_death?
      runner.faction_and_short_name
    elsif runner_score > corporation_score
      runner.faction_and_short_name
    elsif corporation_score > runner_score
      corporation.short_faction_and_short_slogan
    else
      # Unfinished
    end
  end

  def faction_loser
    if flatlined?
      runner.faction_and_short_name
    elsif draw_death?
      corporation.short_faction_and_short_slogan
    elsif runner_score > corporation_score
      corporation.short_faction_and_short_slogan
    elsif corporation_score > runner_score
      runner.faction_and_short_name
    else
      # Unfinished
    end
  end

  def player_winner
    if flatlined?
      corporation_user.userid
    elsif draw_death?
      runner_user.userid
    elsif runner_score > corporation_score
      runner_user.userid
    elsif corporation_score > runner_score
      corporation_user.userid
    else
      # Unfinished
    end
  end

  def player_loser
    if flatlined?
      runner_user.userid
    elsif draw_death?
      corporation_user.userid
    elsif runner_score > corporation_score
      corporation_user.userid
    elsif corporation_score > runner_score
      runner_user.userid
    else
      # Unfinished
    end
  end

  def player_winner_score
    if flatlined?
      corporation_score
    elsif draw_death?
      runner_score
    elsif runner_score > corporation_score
      runner_score
    elsif corporation_score > runner_score
      corporation_score
    else
      # Unfinished
    end
  end

  def player_loser_score
    if flatlined?
      runner_score
    elsif draw_death?
      corporation_score
    elsif runner_score > corporation_score
      corporation_score
    elsif corporation_score > runner_score
      runner_score
    else
      # Unfinished
    end
  end

  scope :runner_wins, where(%Q{
    draw_death = 't' or (
      runner_score > corporation_score and
      flatlined = 'f' and unfinished = 'f'
    )
  })

  scope :corporation_wins, where(%Q{
    flatlined = 't' or (
      corporation_score > runner_score and
      draw_death = 'f' and unfinished = 'f'
    )
  })

  scope :no_winner, where('unfinished is true')

  scope :hb, joins(:corporation).where(:corporations => {:faction => "Haas-Bioroid"})
  scope :jinteki, joins(:corporation).where(:corporations => {:faction => "Jinteki"})
  scope :nbn, joins(:corporation).where(:corporations => {:faction => "NBN"})
  scope :weyland, joins(:corporation).where(:corporations => {:faction => "Weyland Corporation"})

  scope :anarch, joins(:runner).where(:runners => {:faction => "Anarch"})
  scope :criminal, joins(:runner).where(:runners => {:faction => "Criminal"})
  scope :shaper, joins(:runner).where(:runners => {:faction => "Shaper"})
end
