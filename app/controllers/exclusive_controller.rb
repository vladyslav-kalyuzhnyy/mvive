class ExclusiveController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @exclusive = Exclusive.all
    @exclusive = Exclusive.order(created_at: :desc).paginate(page: params[:page], per_page: 11)
  end

  def show
    @exclusive = Exclusive.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @exclusive = current_user.exclusive.build(exclusive_params)
      @exclusive.save
    else
      redirect_to root_path
    end
  end

  private
  def exclusive_params
    params.require(:exclusive).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :body7, :body8, :body9, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6, :image7, :image8, :image9)
  end
end