class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @feedback = @user.feedbacks.build(feedback_params)
    @feedback.creator_id = current_user.id
    if @feedback.save
      flash[:notice] = 'Ваш отзыв успешно добавлен !'
      redirect_to :back
    end
    if @user.feedbacks.blank?
      @average_feedback = 0
    else
      @average_feedback = @user.feedbacks.average(:rating).round(2)
    end
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  private
  def feedback_params
    params.require(:feedback).permit(:rating, :body)
  end
end