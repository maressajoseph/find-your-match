class MatchDay < ApplicationRecord
  after_create :create_matches

  has_many :matches
  belongs_to :available_combination



  def create_matches
    available_students = User.where(admin: false).ids
    used_students = []
    if self.available_combination.combis.length >= available_students.length / 2
      available_combinations = self.available_combination.combis
    else
      available_combinations = available_students.combination(2).to_a
    end

    available_students.each do |student|
      student_combination = find_sub_array(available_combinations, student)
      available_combinations.delete(student_combination)
      available_students -= student_combination
      Match.create(student1: student_combination[0], student2: student_combination[1], match_day: self)
    end

  end

  private
    def find_sub_array(array, value)
      array.each do |subarray|
        if subarray.include?(value)
          return subarray
      end
    end
  end
end
