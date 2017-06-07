class Group < ApplicationRecord
  serialize :combis, Array
  has_many :match_days, dependent: :destroy

end
