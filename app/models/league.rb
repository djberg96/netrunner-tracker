class League < ActiveRecord::Base
  attr_accessible :comments, :name

  validates :name, :presence => true
end
