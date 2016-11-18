# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.mvive.net"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do

  add news_index_path, changefreq: 'always'
  add castings_path, changefreq: 'always'
  add premium_path
  add about_path
  add exclusive_index_path


  News.find_each do |news|
    add '/news/'+news.id.to_s, :lastmod => news.updated_at
  end

  Exclusive.find_each do |exclusive|
    add '/exclusive/'+exclusive.id.to_s, :lastmod => exclusive.updated_at
  end
end