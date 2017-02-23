# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://mvive.net"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do

  add castings_path
  add about_path
  add woman_fashion_index_path
  add men_fashion_index_path
  add beauty_novunku_index_path
  add beauty_trend_index_path
  add event_index_path
  add mvive_tv_index_path

  News.find_each do |news|
    add news_path(news), :lastmod => news.updated_at
  end

  WomanFashion.find_each do |woman_fashion|
    add woman_fashion_path(woman_fashion), :lastmod => woman_fashion.updated_at
  end

  MenFashion.find_each do |men_fashion|
    add men_fashion_path(men_fashion), :lastmod => men_fashion.updated_at
  end

  Fashionshow.find_each do |fashionshow|
    add fashionshow_path(fashionshow), :lastmod => fashionshow.updated_at
  end

  BeautyTrend.find_each do |beauty_trend|
    add beauty_trend_path(beauty_trend), :lastmod => beauty_trend.updated_at
  end

  BeautyNovunku.find_each do |beauty_novunku|
    add beauty_novunku_path(beauty_novunku), :lastmod => beauty_novunku.updated_at
  end

end