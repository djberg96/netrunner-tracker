class Game < ActiveRecord::Base
  attr_accessible :comment, :corporation_id, :corporation_score, :corporation_user_id
  attr_accessible :date, :runner_id, :runner_score, :runner_user_id

  belongs_to :runner_user, :class_name => 'User'
  belongs_to :corporation_user, :class_name => 'User'

  belongs_to :runner
  belongs_to :corporation
end
