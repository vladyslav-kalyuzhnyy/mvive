class PhotosController < ApplicationController
  before_action :authenticate_user!
  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photo.save
    redirect_to "/my_profile"
  end
  
  def destroy
    @photo = Photo.find(params[:id])
  end
  
  private
    def photo_params
      params.require(:photo).permit(:image)
    end
  
end
