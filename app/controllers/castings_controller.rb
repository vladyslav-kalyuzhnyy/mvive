class CastingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :premium]

  def index
    @castings = Casting.all.order('rating DESC')
    @castings = @castings.where("city LIKE ?", "%#{params[:city]}%") unless params[:city].blank?
    @castings = @castings.where("price LIKE ?", "%#{params[:price]}%") unless params[:price].blank?
    @castings = @castings.where("tag1 LIKE ?", "%#{params[:tag1]}%") unless params[:tag1].blank?
    @castings = @castings.where("tag2 LIKE ?", "%#{params[:tag2]}%") unless params[:tag2].blank?
    @castings = @castings.where("tag3 LIKE ?", "%#{params[:tag3]}%") unless params[:tag3].blank?
    @castings = @castings.paginate(page: params[:page], per_page: 5)
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
    @casting = Casting.find(params[:id])
    if current_user == @casting.user
    @casting.destroy
    end
    redirect_to castings_path(@castings)
  end

  def premium

  end


  private
  def casting_params
    params.require(:casting).permit(:rating, :subject, :price, :tag1, :tag2, :tag3, :country_code, :city,
                                    :task, :license => [])
  end
end