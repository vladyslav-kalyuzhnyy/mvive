class BeautyTrendController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @beauty_trend = BeautyTrend.all
    @beauty_trend = BeautyTrend.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def feed
    @beauty_trend = BeautyTrend.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @beauty_trend = BeautyTrend.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @beauty_trend = current_user.beauty_trend.build(beauty_trend_params)
      @beauty_trend.save
    else
      redirect_to news_index_path
    end
  end

  private
  def beauty_trend_params
    params.require(:beauty_trend).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
