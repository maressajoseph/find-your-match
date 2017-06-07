class MatchDay < ApplicationRecord
  after_create :create_matches

  has_many :matches, dependent: :destroy
  belongs_to :group

  validates :day, presence: true, uniqueness: true



  def self.test_self
    puts group.combis.length
  end

  def create_matches
    available_students = User.where(admin: false).where(dummy: false).ids
    if available_students.length.odd?
      available_students << User.where(admin: false).where(dummy: true).ids
      available_students = available_students.flatten
    end
    available_combinations = get_combinations(available_students)

    for i in 0..(available_combinations.first.length-1)/2 do
      student1 = available_combinations.first[i]
      student2 = available_combinations.first[available_combinations.first.length-1-i]
      Match.create(student1: User.find(student1), student2: User.find(student2), match_day: self)
    end
    available_combinations.shift
    self.group.combis = available_combinations.to_a
    self.group.save
  end

  private
  def get_student_combination

  end

  def get_combinations(available_students)
    if self.group.combis.length > 0
      return self.group.combis
    else
      available_combinations = []
      available_combinations[0] = available_students
      for i in (1..available_students.length-1)
        available_combinations[i] = available_combinations[i-1][0..available_students.length-2].rotate + [available_combinations[i-2][available_students.length-1]]
      end
      return available_combinations
    end
  end
end
