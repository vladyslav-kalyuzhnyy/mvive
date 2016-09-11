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
    base_title = "MVive | Новости моды. Freelance платформа для фотографов, моделей и модельеров"
    page_title.empty? ?  base_title : "#{page_title} - MVive"
  end

  def full_description(page_description)
    base_description = "Онлайн сервис для дизайнеров/модельеров, фотографов и моделей. Новости моды 2016. Уникальная Freelance площадка где у Вас есть возможность легко найти партнера для профессиональной фотосъемки, показать себя другим и попасть в мир высокой моды"
    page_description.empty? ?  base_description : "#{page_description} - MVive"
  end
  
end
