class Instructor::SectionsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorize_for_current_user
	def new
		@section = Section.new
	end
	def create
		@section = current_course.sections.create(section_params)
		redirect_to instructor_course_path(current_course)
	end
	private

	helper_method :current_course

	def current_course
		@course ||= Course.find(params[:course_id])
	end

	def section_params
		params.require(:section).permit(:title)
	end

	def require_authorize_for_current_user
		if current_course.user != require_authorize_for_current_user
			return render text: 'Unauthorized', status: :unauthorized
		end
	end

	

end
