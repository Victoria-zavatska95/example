class PhotosController < ApplicationController
before_action :authenticate_user!, except: [:index]
	def index
		@photos = Photo.all
	end
  def new
	@photo = Photo.new
  end

  def create
	@photo = current_user.photos.build(photo_params)

	if @photo.save
		redirect_to photos_path
	end
  end

  def edit
	@photo = Photo.find_by(params[:id])
  end

  def show
  	@photo = Photo.find_by(params[:id])
  end

  def update
  	@photo = Photo.find_by(params[:id])
  	if @photo.save
  		redirect_to root_path
  	end
  end

  def destroy
  	@photo.destroy
  	redirect_to root_path
  	
  end

  private
  def photo_params
  	params.require(:photo).permit(:user_id, :title, :description,  :image)
  end
end
