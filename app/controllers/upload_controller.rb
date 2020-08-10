class UploadController < ApplicationController
	def get
		@picture = Picture.new
	end

	def save
		@picture = Picture.new(picture_params)
		if @picture.save
			redirect_to(action: 'show', id: @picture.id)
		else
			render(action: :get)
		end
	end

	private
	
	def picture_params
		params.require(:picture).permit(:content, :uploaded_picture)
	end
end
