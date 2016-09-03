class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :upvote, :downvote]
  
  def index
    @user = current_user
    if (@user)
      @subscribes = @user.followed_users
      @photos = @subscribes.collect(&:photos).flatten.uniq
      if @photos
        @photos.sort_by(&:created_at)
      end
    end

  end
  
  def new
    
  end
       
  def show
    if params[:id] == current_user.id.to_s
      redirect_to my_profile_path
    else
      @user = User.find(params[:id])
      @profile = @user.profile
      @photos = @user.photos
      @subscribes = @user.followed_users
      unless @user.feedbacks.count == 0
      @rating = ((@user.feedbacks.where("rating = 5").count*5 + @user.feedbacks.where("rating = 4").count*4 + @user.feedbacks.where("rating = 3").count*3 + @user.feedbacks.where("rating = 2").count*2 + @user.feedbacks.where("rating = 1").count).to_f / @user.feedbacks.count).round(2)
      else
         @rating = 0
      end
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
  end
  
  def update
    @user = User.find(params[:id])
    @profile = @user.profile
    if @profile.update_attributes(pParams)
      redirect_to my_profile_path
    else
      render edit_profile_path(@profile)
    end
  end
  
  def destroy
    
  end

  def upvote
    @profile.upvote_from current_user
    redirect_to my_profile_path
  end

  def downvote
    @profile.downvote_from current_user
    redirect_to my_profile_path
  end
  
  def my_profile
    @user = current_user
    @profile = @user.profile
    @photos = @user.photos
    @subscribes = @user.followed_users
    unless @user.feedbacks.count == 0
      @rating = ((@user.feedbacks.where("rating LIKE 5").count*5 + @user.feedbacks.where("rating LIKE 4").count*4 + @user.feedbacks.where("rating LIKE 3").count*3 + @user.feedbacks.where("rating LIKE 2").count*2 +@user.feedbacks.where("rating LIKE 1").count).to_f / @user.feedbacks.count).round(2)
    else
      @rating = 0
    end
  end
  
  def search
    @users = User.all.order('created_at DESC')
    if params[:type]
      @users = @users.where("users.type LIKE ?", "%#{params[:type]}%").order("created_at DESC")
      @users = @users.where("users.city LIKE ?", "%#{params[:city]}%") unless params[:city].blank?
      @users = @users.where("users.country_code LIKE ?", "%#{params[:country]}%") unless params[:country].blank?
      case params[:type]
      when "Model" 
         @users = @users.joins(:model_profile)
         @users = @users.where("model_profiles.experience LIKE ?", "%#{params[:experience]}%") unless params[:experience].blank?
         @users = @users.where("model_profiles.specializationt LIKE ?", "%#{params[:specializationt]}%") unless params[:specialization_t].blank?
         @users = @users.where("model_profiles.specialization LIKE ?", "%#{params[:specialization]}%") unless params[:specialization].blank?
         @users = @users.where("model_profiles.haircolor LIKE ?", "%#{params[:haircolor]}%") unless params[:haircolor].blank?
         @users = @users.where("model_profiles.hairsize LIKE ?", "%#{params[:hairsize]}%") unless params[:hairsize].blank?
         @users = @users.where("model_profiles.clothes LIKE ?", "%#{params[:clothes]}%") unless params[:clothes].blank?
         @users = @users.where("model_profiles.license LIKE ?", "%#{params[:license]}%") unless params[:license].blank?
         unless params[:figure].blank?
           case params[:figure]
           when "big"
             @users = @users.where("model_profiles.height >= 185 AND model_profiles.boobs >= 90 AND model_profiles.waist >= 60 AND model_profiles.hip >= 90")
           when "normal"
             @users = @users.where("model_profiles.height >= 175 AND model_profiles.boobs >= 75 AND model_profiles.waist >= 55 AND model_profiles.hip >= 85")
             @users = @users.where("model_profiles.height <= 185 AND model_profiles.boobs <= 95 AND model_profiles.waist <= 65 AND model_profiles.hip <= 95")
           when "small"
             @users = @users.where("model_profiles.height <= 175 AND model_profiles.boobs <= 90 AND model_profiles.waist <= 60 AND model_profiles.hip <= 90")
           end
         end
       when "Designer"
         @users = @users.joins(:designer_profile)
         @users = @users.where("designer_profiles.experience LIKE ?", "%#{params[:experience]}%") unless params[:experience].blank?
         @users = @users.where("designer_profiles.specialization LIKE ?", "%#{params[:specialization]}%") unless params[:specialization].blank?
       when "Photographer"
         @users = @users.joins(:photographer_profile)
         @users = @users.where("photographer_profiles.experience LIKE ?", "%#{params[:experience]}%") unless params[:experience].blank?
         #fix!
         if (params[:work_place]  && params[:work_place] == "freelance")
           @users = @users.where("photographer_profiles.work_place LIKE ?", "%Фрилансер%") unless params[:work_place].blank?
         else
           @users = @users.where("photographer_profiles.work_place NOT LIKE ?", "%Фрилансер%") unless params[:work_place].blank?
         end
       end
    end
  end
  private
    def photographer_params
      params.require(:photographer_profile).permit(:experience, :p_model, :camera,
                                                   :work_place, {:specialization => []}, {:license => []}) 
    end
    
    def designer_params
      params.require(:designer_profile).permit(:experience, :work_place, {:specialization => []}, {:events => []}) 
    end
    
    def model_params
      params.require(:model_profile).permit(:work_place, :experience, :specializationt, :haircolor, :hairsize,
                                            :face, :eyes, :boobs, :waist, :hip, :height, :mass, :clothes,
                                           {:specialization => []}, {:events => []}, {:license => []})
    end
    
    def pParams
       case current_user.type
       when "Model" 
         model_params
       when "Designer"
         designer_params
       when "Photographer"
         photographer_params
       end
    end
  
end
      