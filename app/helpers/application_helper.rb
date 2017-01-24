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
    base_title = "Мода і Стиль 2017/18. Світське життя, тенденції, подіум, бренди, колекції"
    page_title.empty? ?  base_title : "#{page_title} - MVive"
  end

  def full_description(page_description)
    base_description = "Актуальні новини в світі високої моди та світського життя в Україні: тренди, жіноча мода, виходи нових колекцій, цікаві факти з життя модельєрів"
    page_description.empty? ?  base_description : "#{page_description}"
  end

  def full_keywords(page_keywords)
    base_keywords = "світське життя, мода, стиль, новини моди, львів"
    page_keywords.empty? ? base_keywords : "#{page_keywords}"
  end

  def full_og_title(page_og_title)
    base_og_title = "Мода і Стиль 2017/18. Світське життя, тенденції, подіум, бренди, колекції"
    page_og_title.empty? ?  base_og_title : "#{page_og_title} - M'Vive Fashion News"
  end

  def full_og_description(page_og_description)
    base_og_description = "Актуальні новини в світі високої моди та світського життя в Україні: тренди, жіноча мода, виходи нових колекцій, цікаві факти з життя модельєрів"
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
