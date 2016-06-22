class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
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
    params.require(:news).permit(:name, :short, :body, :news_day, :news_month, :image)
  end
end
