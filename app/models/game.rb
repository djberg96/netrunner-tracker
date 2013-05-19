class Game < ActiveRecord::Base
  attr_accessible :comment, :corporation_id, :corporation_score, :corporation_user_id
  attr_accessible :league_id, :date, :runner_id, :runner_score, :runner_user_id

  belongs_to :runner_user, :class_name => 'User'
  belongs_to :corporation_user, :class_name => 'User'

  belongs_to :runner
  belongs_to :corporation
  belongs_to :league

  validate :runner_and_corporation_are_not_same_player

  # TODO: I want to use a custom label (like "scores"), but I can't get it to
  # work with web-app-theme.
  validate do |game|
    if runner_score < 7 && corporation_score < 7
      msg = "At least one player must score 7 or more points"
      errors.add(:runner_score, msg)
    end

    if runner_score >= 7 && corporation_score >= 7
      msg = "Both players may not have 7 or more points"
      errors.add(:runner_score, msg)
    end
  end

  validates :runner_score,
    :numericality => {
      :greater_than_or_equal_to => 0,
      :less_than_or_equal_to    => 9
    }

  validates :corporation_score,
    :numericality => {
      :greater_than_or_equal_to => 0,
      :less_than_or_equal_to    => 9
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

  def faction_winner
    if runner_score > corporation_score
      runner.faction
    else
      corporation.faction
    end
  end

  def player_winner
    if runner_score > corporation_score
      runner_user.userid
    else
      corporation_user.userid
    end
  end

  scope :runner_wins, where('runner_score > corporation_score')
  scope :corporation_wins, where('runner_score < corporation_score')
end
