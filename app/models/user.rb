class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :league_id, :userid
  belongs_to :league

  has_secure_password
end
