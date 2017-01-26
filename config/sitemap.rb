# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://mvive.net"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do

  add news_index_path
  add castings_path
  add about_path
  add exclusive_index_path
  add event_index_path
  add mvive_tv_index_path

  News.find_each do |news|
    add news_path(news), :lastmod => news.updated_at
  end
end