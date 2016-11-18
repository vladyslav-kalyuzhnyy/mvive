class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @news = News.all
    @news = News.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
  end

  def show
    @news = News.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @news = current_user.news.build(news_params)
      @news.save
    else
      redirect_to news_index_path
    end
  end

  private
  def news_params
    params.require(:news).permit(:name, :short, :body, :body2, :body3, :body4, :news_day, :news_month, :image, :image2, :image3, :image4)
  end
end
