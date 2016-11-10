class FashionandmakeupController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @fashionandmakeup = Fashionandmakeup.all
    @fashionandmakeup = Fashionandmakeup.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
  end

  def show
    @fashionandmakeup = Fashionandmakeup.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @fashionandmakeup = current_user.fashionandmakeup.build(fashionandmakeup_params)
      @fashionandmakeup.save
    else
      redirect_to root_path
    end
  end

  private
  def fashionandmakeup_params
    params.require(:fashionandmakeup).permit(:name, :short, :body, :body2, :body3, :body4, :address, :phone, :image, :image2, :image3, :image4, :image5, :image6)
  end
end