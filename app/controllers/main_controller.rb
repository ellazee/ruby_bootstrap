class MainController < ApplicationController

	def index
		@photos = Photo.all
		@photo = Photo.new
  end

  def photo
  	picture_path = params[:photo][:picture].path
  	cloudinary_file = Cloudinary::Uploader.upload(picture_path)
  	# render json: cloudinary_file
  	photo = Photo.new
  	photo.title = params[:photo][:title]
  	photo.picture = cloudinary_file["public_id"]
  	photo.save!
  	# puts cloudinary_file["public_id"]

  	redirect_to root_path
  end

  def about
  end

  def blog
  end

  def contact
  end
  
  private
  def photo_params
  	params.require(:photo).permit(:title, :picture)
  end


end
