class Course < ApplicationRecord
  validates_presence_of :name
  has_many :course_students
  has_many :students, through: :course_students

  def students_by_grade_formatted
    self.students_by_grade.join(", ")
  end

  def students_by_grade
    self.course_students
    .joins(:student)
    .order(grade: :desc)
    .pluck(:name)
  end
end
