class CreateCourseStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :course_students do |t|
      t.references :course
      t.references :student

      t.timestamps
    end
  end
end
