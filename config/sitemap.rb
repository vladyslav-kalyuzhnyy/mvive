# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.mvive.net"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do

  add '/premium'
  add '/about'

  News.find_each do |news|
    add news_path(news), :lastmod => news.created_at
  end

end
