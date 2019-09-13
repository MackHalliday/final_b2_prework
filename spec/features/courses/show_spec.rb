require 'rails_helper'

# User Story 2, Course Show Page
# As a user,
# When I visit a course show page,
# Then I see:
# - the course's name
# - each student in the course listed in order from highest grade to lowest grade
# ```

RSpec.describe 'Course Show Page', type: :feature do
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

  it 'can display course' do
    visit course_path(@course_2)

    within "#course-info-#{@course_2.id}" do
      expect(page).to have_content(@course_2.name)

      within "#student-info-#{@course_2.id}" do
        expect(page).to have_content("Enrollment: #{@student_3.name}, #{@student_2.name}, #{@student_1.name}")
      end

      expect(page).to_not have_css("#course-info-#{@course_1.id}")
      expect(page).to_not have_css("#course-info-#{@course_3.id}")
    end
  end
end
