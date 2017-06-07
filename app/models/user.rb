class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student1_matches, class_name: "Match", foreign_key: :student1_id
  has_many :student2_matches, class_name: "Match", foreign_key: :student2_id

  def is_admin?
    admin
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def change_admin
    self.admin = !self.admin
    self.save
  end
end
