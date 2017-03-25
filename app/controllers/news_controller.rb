class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @news = News.all
    @news = News.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @news = News.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
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
    params.require(:news).permit(:name, :short, :body, :body2, :body3, :body4, :body5,:body6,:body7,:body8,:body9,:body10, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6, :image7, :image8, :image9, :image10)
  end
end
