class FashionshowController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @fashionshow = Fashionshow.all
    @fashionshow = Fashionshow.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @fashionshow = Fashionshow.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @fashionshow = Fashionshow.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @fashionshow = current_user.fashionshow.build(fashionshow_params)
      @fashionshow.save
    else
      redirect_to news_index_path
    end
  end

  private
  def fashionshow_params
    params.require(fashionshow).permit(:name, :short, :body, :body2, :body3, :body4, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6, :image7, :image8, :image9, :image10, :image11, :image12, :image13, :image14, :image15)
  end
end
