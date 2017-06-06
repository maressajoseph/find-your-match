class Match < ApplicationRecord
  belongs_to :student1, class_name: "User", foreign_key: :student1_id
  belongs_to :student2, class_name: "User", foreign_key: :student2_id
  belongs_to :match_day

end
