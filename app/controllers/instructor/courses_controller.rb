class Instructor::CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorize_for_current_user, only: [:show]
	def new
		@course = Course.new
	end
	def create
		@course = current_user.courses.create(course_params)
		if @course.valid?
			redirect_to instructor_course_path(@course)
		else
			render :new, status: :unprocessed_entity
		end
	end
	def show
	end
	private 

	helper_method :current_course

	def require_authorize_for_current_user
		if current_course.user != current_user
			return render text: 'Unauthorized', status: :unauthorized
		end
	end

	def current_course
		@course ||= Course.find(params[:id])
	end

	def course_params
		params.require(:course).permit(:title, :description, :cost)
	end
end
