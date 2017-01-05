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
    base_title = "Мода 2016/17. Новости моды 2016-2017 | Fashion News"
    page_title.empty? ?  base_title : "#{page_title} - MVive"
  end

  def full_description(page_description)
    base_description = "Только актуальные новости в мире высокой моды: тренды, женская мода, выходы новых коллекций, интересные факты из жизни модельеров и другое !"
    page_description.empty? ?  base_description : "#{page_description}"
  end

  def full_keywords(page_keywords)
    base_keywords = "мода 2016, женская мода, новости, новости моды, женская мода 2016, Мода, мода 2016 года, тренды, коллекции"
    page_keywords.empty? ? base_keywords : "#{page_keywords}"
  end

  def full_og_title(page_og_title)
    base_og_title = "Мода 2016/17. Новости моды 2016-2017 | M'Vive Fashion News"
    page_og_title.empty? ?  base_og_title : "#{page_og_title} - M'Vive Fashion News"
  end

  def full_og_description(page_og_description)
    base_og_description = "Только актуальные новости в мире высокой моды: тренды, женская мода, выходы новых коллекций, интересные факты из жизни модельеров и другое !"
    page_og_description.empty? ?  base_og_description : "#{page_og_description}"
  end

  def full_og_url(page_og_url)
    base_og_url = "http://mvive.net"
    page_og_url.empty? ?  base_og_url : "#{page_og_url}"
  end

  def full_og_image(page_og_image)
    base_og_image = ""
    page_og_image.empty? ?  base_og_image : "#{page_og_image}"
  end
  
end
