class MenFashionController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @men_fashion = MenFashion.all
    @men_fashion = MenFashion.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @men_fashion = MenFashion.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @men_fashion = MenFashion.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @men_fashion = current_user.men_fashion.build(men_fashion_params)
      @men_fashion.save
    else
      redirect_to news_index_path
    end
  end

  private
  def men_fashion_params
    params.require(:men_fashion).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
