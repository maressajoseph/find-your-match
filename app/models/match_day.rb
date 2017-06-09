class MatchDay < ApplicationRecord
after_create :create_matches

  has_many :matches, dependent: :destroy
  belongs_to :group

  validates :day, presence: true, uniqueness: true



  def create_matches
    available_students = get_available_students
    all_combinations = get_combinations(available_students)
    available_combinations = deplete_combinations(all_combinations, self.group.combis)
    if available_combinations.empty?
      self.group.combis = []
      available_combinations = all_combinations
    end
    available_combinations.first.each do |set|
      Match.create(student1: User.find(set.first), student2: User.find(set.last), match_day: self)
      self.group.combis << set
    end
    self.group.save
  end


  private
  def get_available_students
    available_students = User.where(admin: false).where(dummy: false).ids
    if available_students.length.odd?
      available_students << User.where(admin: false).where(dummy: true).ids
      available_students = available_students.flatten
    end
    return available_students
  end

  def get_combinations(available_students)
    matchtable = []
    matchtable[0] = available_students
    for i in (1..available_students.length-1)
      matchtable[i] = matchtable[i-1][0..available_students.length-2].rotate + [matchtable[i-2][available_students.length-1]]
    end

    all_combinations = []
    for i in 0..(matchtable.length-2)
      daily_matches = []
      for t in 0..(matchtable[i].length-1)/2 do
        student1 = matchtable[i][t]
        student2 = matchtable[i][matchtable[i].length-1-t]
        daily_matches << [student1, student2]
      end
      all_combinations << daily_matches
    end
    return all_combinations
  end

  def deplete_combinations(all_combinations, used_combinations)
    all_combinations.each do |daily_set|
      daily_set.delete_if { daily_set - used_combinations != daily_set }
    end
    all_combinations = all_combinations.reject { |com| com.empty?}
  end
end
