class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
		@sections = @course.sections.order(:id)
	end

end
