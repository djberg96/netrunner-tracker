class League < ActiveRecord::Base
  attr_accessible :comments, :name, :created_by

  has_many :games

  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'

  validates :name,
    :presence   => true,
    :uniqueness => true,
    :length => {
      :minimum => 2,
      :maximum => 32
    }

  ## Pagination

  paginates_per 10
end
