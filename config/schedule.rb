every 1.day, :at => '5:00 am' do
  rake "-s sitemap:refresh"
end

every :day, at: '2am' do
  rake 'delete_castings'
end