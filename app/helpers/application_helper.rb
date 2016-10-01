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
    base_title = "MVive - Фриланс для фотографов, моделей, стилистов и модельеров"
    page_title.empty? ?  base_title : "#{page_title} - MVive"
  end

  def full_description(page_description)
    base_description = "Онлайн сервис для модельеров, фотографов, моделей и стилистов. Быстро и легко ищите партнера для фотосессии. Предлагайте свои услуги в мире высокой моды !"
    page_description.empty? ?  base_description : "#{page_description}"
  end

  def full_keywords(page_keywords)
    base_keywords = "фотограф, модельер, модель, фриланс, кастинг, стилист"
    page_keywords.empty? ? base_keywords : "#{page_keywords}"
  end
  
end
