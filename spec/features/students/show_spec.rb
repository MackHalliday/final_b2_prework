require 'rails_helper'

RSpec.describe 'Student Show Page', type: :feature do
  before :each do
    @student_1 = Student.create(name: "Student 1")
    @student_2 = Student.create(name: "Student 2")
    @student_3 = Student.create(name: "Student 3")

    @course_1 = Course.create(name: "Course 1")
      @course_student_1 = CourseStudent.create(student: @student_1, course: @course_1, grade: 95.0)
      @course_student_2 = CourseStudent.create(student: @student_2, course: @course_1, grade: 87.5)
      @course_student_3 = CourseStudent.create(student: @student_3, course: @course_1, grade: 80.5)

    @course_2 = Course.create(name: "Course 2")
      @course_student_4 = CourseStudent.create(student: @student_1, course: @course_2, grade: 75.0)
      @course_student_5 = CourseStudent.create(student: @student_2, course: @course_2, grade: 85.0)
      @course_student_6 = CourseStudent.create(student: @student_3, course: @course_2, grade: 92.0)

    @course_3 = Course.create(name: "Course 3")
      @course_student_7 = CourseStudent.create(student: @student_2, course: @course_3, grade: 100.0)
      @course_student_8 = CourseStudent.create(student: @student_3, course: @course_3, grade: 90.0)
  end

  it 'can display student information' do
    visit student_path(@student_1)

    within "#student-info-#{@student_1.id}" do
      expect(page).to have_content(@student_1.name)

      within "#course-info-#{@course_1.id}" do
        expect(page).to have_content(@course_student_1.course.name)
        expect(page).to have_content(@course_student_1.grade)
      end

      within "#course-info-#{@course_2.id}" do
        expect(page).to have_content(@course_student_4.course.name)
        expect(page).to have_content(@course_student_4.grade)
      end

      expect(page).to_not have_css("#course-info-#{@course_3.id}")
    end
  end
end
