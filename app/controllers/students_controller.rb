class StudentsController < ActionController::Base
  def show
    @student = Student.find(params[:id])
  end
end
