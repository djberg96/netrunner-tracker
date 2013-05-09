class Game < ActiveRecord::Base
  attr_accessible :comment, :corp_id, :corp_score, :corp_user_id, :date
  attr_accessible :runner_id, :runner_score, :runner_user_id

  belongs_to :user, :foreign_key => :runner_user_id
  belongs_to :user, :foreign_key => :corp_user_id

  belongs_to :runner
  belongs_to :corporation
end
