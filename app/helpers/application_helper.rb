module ApplicationHelper
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def full_title(page_title)
    base_title = "MVive - Фриланс для фотографов, моделей и модельеров"
    page_title.empty? ?  base_title : "#{page_title} - MVive"
  end

  def full_description(page_description)
    base_description = "Онлайн сервис для модельеров, фотографов и моделей. Быстро и легко ищите партнера для фотосессии."
    page_description.empty? ?  base_description : "#{page_description}"
  end
  
end
