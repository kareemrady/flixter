class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :user_enrolled_in_course?
	
	def show
	end


	private

	helper_method :current_lesson
	helper_method :user_enrolled_in_course?
		
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end
	
	def user_enrolled_in_course?
		course = current_lesson.section.course
		condition =  current_user.enrolled_in?(course)
		if (condition)
		 return true
		else
		 redirect_to course_path(course), alert: 'You need to Enroll in Course'
		end
	end
end
