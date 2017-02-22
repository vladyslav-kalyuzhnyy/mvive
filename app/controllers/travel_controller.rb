class TravelController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @travel = Travel.all
    @travel = Travel.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @travel = Travel.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @travel = Travel.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @travel = current_user.travel.build(travel_params)
      @travel.save
    else
      redirect_to news_index_path
    end
  end

  private
  def travel_params
    params.require(:travel).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
