class CastingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @castings = Casting.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @casting = Casting.new
  end

  def create
    @casting = current_user.castings.build(casting_params)
    if @casting.save
      redirect_to casting_path(@casting)
    else
      redirect_to new_casting_path
    end
  end

  def show
    @casting = Casting.find(params[:id])
    @user = @casting.user
    @comments = @casting.comments
    @comment = Comment.new
  end

  def select_user
    @casting = Casting.find(params[:id])
    @casting.selected += (params[:usr] + "o")
    @casting.save
    redirect_to casting_path(@casting)
  end

  def unselect_user
    @casting = Casting.find(params[:id])
    x = @casting.selected.delete(params[:usr] + "o")
    @casting.selected = x
    @casting.save
    redirect_to casting_path(@casting)
  end

  def destroy
    @user = User.find(params[:user_id])
    @casting = Casting.find(params[:id])
    @casting.destroy
    redirect_to castings_path(@castings)
  end


  private
  def casting_params
    params.require(:casting).permit(:rating, :destroy, :subject, :price, :tag1, :tag2, :tag3, :country_code, :city,
                                    :task, :license => [])
  end
end