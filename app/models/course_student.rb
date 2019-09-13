class CourseStudent < ApplicationRecord
  validates_presence_of :course_id, :student_id, :grade
  belongs_to :course
  belongs_to :student
end
