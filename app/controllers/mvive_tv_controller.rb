class MviveTvController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @mvivetv = MviveTv.all
    @mvivetv = MviveTv.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
  end

  def show
    @mvivetv = MviveTv.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @mvivetv = current_user.mvivetv.build(mvivetv_params)
      @mvivetv.save
    else
      redirect_to root_path
    end
  end

  private
  def mvivetv_params
    params.require(:mvivetv).permit(:name, :short, :body, :body2, :news_day, :news_month, :image, :video)
  end
end
