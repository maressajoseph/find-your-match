class Group < ApplicationRecord
  serialize :combis, Array
  has_many :matchdays

end
