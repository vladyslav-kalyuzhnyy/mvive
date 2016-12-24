class PeopleandpartyController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @peopleandparty = Peopleandparty.all
    @peopleandparty = Peopleandparty.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
  end

  def show
    @peopleandparty = Peopleandparty.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @peopleandparty = current_user.peopleandparty.build(peopleandparty_params)
      @peopleandparty.save
    else
      redirect_to news_index_path
    end
  end

  private
  def peopleandparty_params
    params.require(:peopleandparty).permit(:name, :short, :body, :body2, :body3, :body4, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6, :image7, :image8, :image9, :image10)
  end
end