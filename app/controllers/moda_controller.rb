class ModaController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @moda = Moda.all
    @moda = Moda.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def feed
    @moda = Moda.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @moda = Moda.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @moda = current_user.moda.build(moda_params)
      @moda.save
    else
      redirect_to news_index_path
    end
  end

  private
  def moda_params
    params.require(:moda).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
