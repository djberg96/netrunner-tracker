class Game < ActiveRecord::Base
  attr_accessible :comment, :corporation_id, :corporation_score, :corporation_user_id
  attr_accessible :league_id, :date, :runner_id, :runner_score, :runner_user_id

  belongs_to :runner_user, :class_name => 'User'
  belongs_to :corporation_user, :class_name => 'User'

  belongs_to :runner
  belongs_to :corporation
  belongs_to :league

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
end
