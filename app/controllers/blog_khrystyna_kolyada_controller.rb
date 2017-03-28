class BlogKhrystynaKolyadaController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @blog_khrystyna_kolyada = BlogKhrystynaKolyada.all
    @blog_khrystyna_kolyada = BlogKhrystynaKolyada.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def feed
    @blog_khrystyna_kolyada = BlogKhrystynaKolyada.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @blog_khrystyna_kolyada = BlogKhrystynaKolyada.friendly.find(params[:id])
  end

  def create
    if(current_user.is_admin?)
      @blog_khrystyna_kolyada = current_user.blog_khrystyna_kolyada.build(blog_khrystyna_kolyada_params)
      @blog_khrystyna_kolyada.save
    else
      redirect_to news_index_path
    end
  end

  private
  def blog_khrystyna_kolyada_params
    params.require(:blog_khrystyna_kolyada).permit(:name, :short, :body, :body2, :body3, :body4, :body5, :body6, :body7, :body8, :news_day, :news_month, :image, :image2, :image3, :image4, :image5, :image6, image7, image8)
  end
end
