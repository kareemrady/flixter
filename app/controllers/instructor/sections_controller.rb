class Instructor::SectionsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_authorize_for_current_user , only: [:new, :create]
	before_action :require_authorized_for_current_section, only: [:update]
			
	def new
		@section = Section.new
	end
	def create
		@section = current_course.sections.create(section_params)
		redirect_to instructor_course_path(current_course)
	end
	
	def update
		current_section.update_attributes(section_params)
		
		render text: 'Updated!'
	end
	private

	helper_method :current_course
	
	def current_section
			@section ||= Section.find(params[:id])
	end
	
	def require_authorized_for_current_section
		if current_section.course.user != current_user
			render text: 'Unauthorized!' , status: :unauthorized
		end
	end

	def current_course
		@course ||= Course.find(params[:course_id])
	end

	def section_params
		params.require(:section).permit(:title, :row_order_position)
	end

	def require_authorize_for_current_user
		if current_course.user != current_user

			return render text: 'Unauthorized', status: :unauthorized
		end
	end

	

end
