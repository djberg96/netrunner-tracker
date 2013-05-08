class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :league_id, :userid
  attr_accessible :password, :password_confirmation

  belongs_to :league

  has_secure_password

  validates :password,
    :presence => true,
    :length   => {
      :minimum  => 6,
      :maximum  => 32
    }
end
