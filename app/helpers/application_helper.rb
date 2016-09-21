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
    base_title = "M'Vive | Новости моды 2016-2017 | Freelance для фотографов, моделей и модельеров"
    page_title.empty? ?  base_title : "#{page_title} - MVive"
  end
  
end
