class LifestyleController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @lifestyle = Lifestyle.all
    @lifestyle = Lifestyle.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def feed
    @lifestyle = Lifestyle.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @lifestyle = Lifestyle.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @lifestyle = current_user.lifestyle.build(lifestyle_params)
      @lifestyle.save
    else
      redirect_to news_index_path
    end
  end

  private
  def lifestyle_params
    params.require(:lifestyle).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
