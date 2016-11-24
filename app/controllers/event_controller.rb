class EventController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @event = Event.all
    @event = Event.order(created_at: :desc).paginate(page: params[:page], per_page: 7)
  end

  def show
    @event = Event.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @event = current_user.event.build(event_params)
      @event.save
    else
      redirect_to news_index_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :short, :body, :body2, :body3, :body4, :events_day, :events_month, :events_adress, :image, :image2, :image3, :image4)
  end
end