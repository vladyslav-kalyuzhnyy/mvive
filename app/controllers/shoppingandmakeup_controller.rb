class ShoppingandmakeupController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @shoppingandmakeup = Shoppingandmakeup.all
    @shoppingandmakeup = Shoppingandmakeup.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def show
    @shoppingandmakeup = Shoppingandmakeup.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @shoppingandmakeup = current_user.shoppingandmakeup.build(shoppingandmakeup_params)
      @shoppingandmakeup.save
    else
      redirect_to root_path
    end
  end

  private
  def shoppingandmakeup_params
    params.require(:shoppingandmakeup).permit(:name, :short, :body, :body2, :body3, :body4, :address, :phone, :image, :image2, :image3, :image4, :image5, :image6)
  end
end