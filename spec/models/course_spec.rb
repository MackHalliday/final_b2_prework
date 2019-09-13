require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should validate_presence_of :name }

  describe 'methods' do
    before :each do
      @student_1 = Student.create(name: "Student 1")
      @student_2 = Student.create(name: "Student 2")
      @student_3 = Student.create(name: "Student 3")
      @student_4 = Student.create(name: "Student 4")
      @student_5 = Student.create(name: "Student 5")
      @student_6 = Student.create(name: "Student 6")
      @student_7 = Student.create(name: "Student 7")

      @course_1 = Course.create(name: "Course 1")
        @course_student_1 = CourseStudent.create(student: @student_1, course: @course_1, grade: 95.0)
        @course_student_2 = CourseStudent.create(student: @student_2, course: @course_1, grade: 87.5)
        @course_student_3 = CourseStudent.create(student: @student_3, course: @course_1, grade: 80.5)
        @course_student_4 = CourseStudent.create(student: @student_4, course: @course_1, grade: 98.5)
        @course_student_5 = CourseStudent.create(student: @student_5, course: @course_1, grade: 72.0)
        @course_student_6 = CourseStudent.create(student: @student_6, course: @course_1, grade: 30.5)
        @course_student_7 = CourseStudent.create(student: @student_7, course: @course_1, grade: 100.0)
    end
    it 'returns students name by highest to lowest grade' do
      expected = [@student_7.name, @student_4.name, @student_1.name, @student_2.name, @student_3.name, @student_5.name, @student_6.name]

      expect(@course_1.students_by_grade).to eq(expected)
    end

    it 'returns student names formatted for course show view' do
      expected = "Student 7, Student 4, Student 1, Student 2, Student 3, Student 5, Student 6"

      expect(@course_1.students_by_grade_formatted). to eq(expected)
    end
  end
end
