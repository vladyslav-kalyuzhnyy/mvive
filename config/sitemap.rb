# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.mvive.net"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do

  add '/castings'
  add '/premium'
  add '/about'

  SitemapGenerator::Sitemap.create do
    add '/news', changefreq: 'weekly'
    News.find_each do |news|
      add news_path(news), lastmod: news.updated_at
    end
  end

end
