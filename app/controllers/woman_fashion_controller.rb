class WomanFashionController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @woman_fashion = WomanFashion.all
    @woman_fashion = WomanFashion.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @woman_fashion = WomanFashion.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @woman_fashion = WomanFashion.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @woman_fashion = current_user.woman_fashion.build(woman_fashion_params)
      @woman_fashion.save
    else
      redirect_to news_index_path
    end
  end

  private
  def woman_fashion_params
    params.require(:woman_fashion).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
