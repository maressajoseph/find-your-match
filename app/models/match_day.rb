class MatchDay < ApplicationRecord
  after_create :create_matches

  has_many :matches
  belongs_to :available_combination

  def self.test_self
    puts available_combination.combis.length
  end

  def create_matches
    available_students = User.where(admin: false).ids
    available_combinations = get_combinations(available_students)

    while available_students.length >= 2 do
      student_combination = find_sub_array(available_combinations, available_students.first, available_students)
      available_combinations.delete(student_combination)
      available_students -= student_combination
      Match.create(student1: User.find(student_combination[0]), student2: User.find(student_combination[1]), match_day: self)
    end
    self.available_combination.combis = available_combinations
    self.available_combination.save
  end

  private

  def find_sub_array(available_combinations, student, available_students)
    available_combinations.each do |subarray|
      if subarray.include?(student) && (subarray - available_students).empty?
        return subarray
      end
    end
  end

  def get_combinations(available_students)
    if self.available_combination.combis.length >= available_students.length / 2
      self.available_combination.combis
    else
      available_students.combination(2).to_a
    end
  end
end
