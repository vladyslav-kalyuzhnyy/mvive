class BeautyNovunkuController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @beauty_novunku = BeautyNovunku.all
    @beauty_novunku = BeautyNovunku.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @beauty_novunku = BeautyNovunku.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @beauty_novunku = BeautyNovunku.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @beauty_novunku = current_user.beauty_novunku.build(beauty_novunku_params)
      @beauty_novunku.save
    else
      redirect_to news_index_path
    end
  end

  private
  def beauty_novunku_params
    params.require(:beauty_novunku).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
