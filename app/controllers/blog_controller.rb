class BlogController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @blog = Blog.all
    @blog = Blog.order(created_at: :desc).paginate(page: params[:page], per_page: 11)
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @blog = current_user.blog.build(blog_params)
      @blog.save
    else
      redirect_to root_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :body7, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6, :image7)
  end
end