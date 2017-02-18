class KrasotaTaZdorovjaController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @krasota_ta_zdorovja = KrasotaTaZdorovja.all
    @krasota_ta_zdorovja = KrasotaTaZdorovja.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @krasota_ta_zdorovja = KrasotaTaZdorovja.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @krasota_ta_zdorovja = KrasotaTaZdorovja.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @krasota_ta_zdorovja = current_user.krasota_ta_zdorovja.build(krasota_ta_zdorovja_params)
      @krasota_ta_zdorovja.save
    else
      redirect_to news_index_path
    end
  end

  private
  def krasota_ta_zdorovja_params
    params.require(:krasota_ta_zdorovja).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
