class MatchDay < ApplicationRecord
  after_create :create_matches

  has_many :matches
  belongs_to :group

  validates :day, presence: true, uniqueness: true



  def self.test_self
    puts group.combis.length
  end

  def create_matches
    available_students = User.where(admin: false).ids
    groups = get_combinations(available_students)
    if available_students.length.odd?
    
    end

    while available_students.length > 1 do
      student_combination = find_sub_array(groups, available_students, available_students.first)
      groups.delete(student_combination)
      available_students -= student_combination
      Match.create(student1: User.find(student_combination[0]), student2: User.find(student_combination[1]), match_day: self)
    end
    self.group.combis = groups
    self.group.save
  end

  private

  def find_sub_array(groups, available_students, student)
    groups.each do |subarray|
      if subarray.include?(student) && (subarray - available_students).empty?
        return subarray
      end
    end
  end

  def get_combinations(available_students)
    if self.group.combis.length >= available_students.length / 2
      self.group.combis
    else
      available_students.combination(2).to_a
    end
  end
end
