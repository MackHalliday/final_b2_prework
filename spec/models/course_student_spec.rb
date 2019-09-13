require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  it { should validate_presence_of :student_id }
  it { should validate_presence_of :course_id }
end
