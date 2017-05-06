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
    params.require(:event).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :body7, :body8, :body9, :body10, :body11, :body12, :body13, :events_day, :events_month,
                                  :events_adress, :image, :image2, :image3, :image4, :image5, :image6, :image7,
                                  :image8, :image9, :image10, :image11, :image12, :image13, :image14, :image15, :image16,
                                  :image17, :image18, :image19, :image20, :image21, :image22, :image23, :image24, :image25,
                                  :image26, :image27, :image28, :image29, :image30, :image31, :image32, :image33, :image34,
                                  :image35, :image36, :image37, :image38, :image39, :image40, :image41, :image42, :image43,
                                  :image44, :image45, :image46, :image47, :image48, :image49, :image50)
  end
end