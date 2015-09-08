class ImagesController < ApplicationController
  def new
  end

  def create
 	@image = Image.create(image_params)
  	if @image.save
  	  render json: { message: "success" }, :status => 200
  	else
  	  #  you need to send an error header, otherwise Dropzone
          #  will not interpret the response as an error:
  	  render json: { error: @image.errors.full_messages.join(',')}, :status => 400
  	end 
  end

  private
  def image_params
  	params.require(:image).permit(:image)
  end
end
