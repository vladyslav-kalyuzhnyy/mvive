class FashionshowController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @fashionshow = Fashionshow.all
    @fashionshow = Fashionshow.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
  end

  def show
    @fashionshow = Fashionshow.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @fashionshow = current_user.fashionshow.build(fashionshow_params)
      @fashionshow.save
    else
      redirect_to root_path
    end
  end

  private
  def fashionshow_params
    params.require(:fashionshow).permit(:name, :short, :body, :body2, :body3, :body4, :address, :phone, :image, :image2, :image3, :image4, :image5, :image6)
  end
end