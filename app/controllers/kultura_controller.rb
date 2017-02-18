class KulturaController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @kultura = Kultura.all
    @kultura = Kultura.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @kultura = Kultura.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @kultura = Kultura.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @kultura = current_user.kultura.build(kultura_params)
      @kultura.save
    else
      redirect_to news_index_path
    end
  end

  private
  def kultura_params
    params.require(:kultura).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6)
  end
end
