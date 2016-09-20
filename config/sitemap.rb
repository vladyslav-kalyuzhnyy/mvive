# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.mvive.net"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do

  add news_index_path, changefreq: 'always'
  add castings_path, changefreq: 'always'
  add premium_path
  add about_path


  News.find_each do |news|
    add news_index_path(news), :lastmod => news.updated_at
  end

end
