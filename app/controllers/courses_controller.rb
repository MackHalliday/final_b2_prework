class CoursesController < ActionController::Base
  def show
    @course = Course.find(params[:id])
  end
end
