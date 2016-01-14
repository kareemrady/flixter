class Instructor::PhotosController < ApplicationController
	def create
		@course = Course.find(params[:course_id])
		@course.photos.create(photo_params)
		redirect_to instructor_path(@course)
	end

	private

	def photo_params
		params.require(:photo).permit(:image)
	end
end
