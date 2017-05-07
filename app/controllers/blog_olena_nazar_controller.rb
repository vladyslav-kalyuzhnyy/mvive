class BlogOlenaNazarController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @blog_olena_nazar = BlogOlenaNazar.all
    @blog_olena_nazar = BlogOlenaNazar.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @blog_olena_nazar = BlogOlenaNazar.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @blog_olena_nazar = BlogOlenaNazar.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @blog_olena_nazar = current_user.blog_olena_nazar.build(blog_olena_nazar_params)
      @blog_olena_nazar.save
    else
      redirect_to news_index_path
    end
  end

  private
  def blog_olena_nazar_params
    params.require(:blog_olena_nazar).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :body7, :body8, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6, image7, image8)
  end
end
